/*
Thor Server Project
Copyright 2008 Joe Hegarty


This file is part of The Thor Server Project.

The Thor Server Project is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

The Thor Server Project is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with The Thor Server Project.  If not, see <http://www.gnu.org/licenses/>.
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ThorServer.Core;
using ThorServer.Utilities;
using ThorServer.Game.Rooms;

namespace ThorServer.Game.Rooms.Reactors
{
    public class RoomCommonReactor : Reactor
    {
        protected RoomInstance mRoomInstance;

        public override void Ping()
        {
            InstanceManager.Sessions.GetSession(mSessionID).UpdateLastTime();
        }

        public void RegisterInstance(RoomInstance roomInstance)
        {
            mRoomInstance = roomInstance;
        }

        //52 - "CHAT": "@t"
        public void Listener52()
        {

            string message = FuseMessage.getArgument(1, mPacketBody);
            InstanceManager.Game.Misc.ChatFilter.FilterText(ref message, mSessionID, mRoomInstance.RoomInfo.RoomID, false, "say");
            RoomUser user = mRoomInstance.GetUser(mSessionID);

            if (message != null && !user.SpecialStates.ContainsKey("mute"))
            {
                ApplyEmotes(message);
                mRoomInstance.RoomTalkBroadcast(user.CurrentX, user.CurrentY, message, user.RoomUserID);
                mRoomInstance.MakeTalk(mSessionID, message);
            }

        }

        //55 - "SHOUT": "@w"
        public void Listener55()
        {

            string message = FuseMessage.getArgument(1, mPacketBody);
            InstanceManager.Game.Misc.ChatFilter.FilterText(ref message, mSessionID, mRoomInstance.RoomInfo.RoomID, false, "shout");

            if (message != null && !mRoomInstance.GetUser(mSessionID).SpecialStates.ContainsKey("mute"))
            {
                ApplyEmotes(message);
                mMessage.Init(26); //@Z
                mMessage.appendString(ArgumentEncoding.encodeInt(mRoomInstance.GetUser(mSessionID).RoomUserID));
                mMessage.appendString(message);
                mMessage.appendChar(2);
                mRoomInstance.RoomBroadcast(mMessage);
                mRoomInstance.MakeTalk(mSessionID, message);
            }

        }

        //56 - "WHISPER": "@x"
        public void Listener56()
        {

            string message = FuseMessage.getArgument(1, mPacketBody);
            int tSpace = message.IndexOf(" ");
            string user = message.Substring(0, tSpace);
            string chat = message.Substring(tSpace + 1);
            InstanceManager.Game.Misc.ChatFilter.FilterText(ref chat, mSessionID, mRoomInstance.RoomInfo.RoomID, false, "whisper to " + user);

            if (chat != null && !mRoomInstance.GetUser(mSessionID).SpecialStates.ContainsKey("mute"))
            {
                ApplyEmotes(chat);
                long sender = mRoomInstance.GetUser(mSessionID).SessionID;
                long receiver = mRoomInstance.GetUser(user).SessionID;
                mMessage.Init(25); //@Y
                mMessage.appendString(ArgumentEncoding.encodeInt(mRoomInstance.GetUser(mSessionID).RoomUserID));
                mMessage.appendString(chat);
                mMessage.appendChar(2);
                mRoomInstance.SendMessage(mMessage, sender);
                mRoomInstance.SendMessage(mMessage, receiver);
                mRoomInstance.MakeTalk(mSessionID, chat);
            }

        }

        //60 - "G_HMAP": "@|" 
        public void Listener60()
        {

            mMessage.Init(31); //@_
            mMessage.appendString(mRoomInstance.Interactor.ClientMap);
            SendMessage(mMessage);

        }

        //61 - "G_USRS": "@}"
        public void Listener61()
        {

            mRoomInstance.SendUserList(mSessionID);

        }

        //62 - "G_OBJS": "@~"
        public void Listener62()
        {
            mMessage.Init(30); //@^
            mMessage.appendString(mRoomInstance.Interactor.BuildFloorObjectList());
            SendMessage(mMessage);

            mMessage.Init(32); //@`
            mMessage.appendString(mRoomInstance.Interactor.BuildFloorFurniList());
            SendMessage(mMessage);
        }

        //63 - "G_ITEMS": "@"
        public void Listener63()
        {
            mMessage.Init(45); //@m
            mMessage.appendString(mRoomInstance.Interactor.BuildWallFurniList());
            SendMessage(mMessage);
        }

        //64 - "G_STAT": "A@"
        public void Listener64()
        {
            mRoomInstance.ActivateUser(mSessionID);
        }



        //75 - "MOVE": "AK"
        public void Listener75()
        {
            int x = Base64Encoding.DecodeInt(mPacketBody.Substring(0, 2));
            int y = Base64Encoding.DecodeInt(mPacketBody.Substring(2));
            mRoomInstance.Interactor.RequestMovePlayer(mSessionID, x, y, null, false);
        }

        //79 - "LOOKTO": "AO"
        public void Listener79()
        {
            RoomUser user = mRoomInstance.GetUser(mSessionID);
            string[] part = mPacketBody.Split(' ');
            int x, y;

            if (!user.IsMoving)
            {
                if (part.Length == 2)
                {
                    if (int.TryParse(part[0], out x) && int.TryParse(part[1], out y))
                    {
                        int newDir = SpecialMath.WorkDirection(user.CurrentX, user.CurrentY, x, y);
                        bool updateBody = !(newDir == user.BodyDirection + 1 || newDir == user.BodyDirection - 1 || newDir == user.BodyDirection - 7 || newDir == user.BodyDirection + 7);

                        if (!user.SpecialStates.ContainsKey("lay") && !user.SpecialStates.ContainsKey("sit"))
                        {
                            user.HeadDirection = newDir;
                            if (updateBody) user.BodyDirection = newDir;
                            mRoomInstance.AnnounceUserStatus(mSessionID, true);
                        }
                        else
                        {
                            if (!updateBody) user.HeadDirection = newDir;
                            mRoomInstance.AnnounceUserStatus(mSessionID, true);
                        }
                    }
                }
            }
        }

        //86 - "CRYFORHELP": "AV"
        public void Listener86()
        {
            string message = FuseMessage.getArgument(1, mPacketBody);
            InstanceManager.Game.Moderation.CallForHelp(mRoomInstance.GetUser(mSessionID), mRoomInstance.RoomInfo, message);
        }

        //88 - "STOP": "AX"
        public void Listener88()
        {
            switch (mPacketBody)
            {
                case "Dance":
                    mRoomInstance.RemoveUniqueStatus(mSessionID, "dance");
                    break;
                case "CarryItem":
                    mRoomInstance.RemoveUniqueStatus(mSessionID, "carryd");
                    break;
            }
        }

        //93 - "DANCE": "A]"
        public void Listener93()
        {
            if (!mRoomInstance.HasUniqueStatus(mSessionID, "sit") && !mRoomInstance.HasUniqueStatus(mSessionID, "lay") && !mRoomInstance.HasUniqueStatus(mSessionID, "swim"))
            {
                if (mPacketBody.Length == 0)
                {
                    mRoomInstance.RemoveUniqueStatuses(mSessionID, "");
                    ApplyUniqueStatus("dance", 0, null, true, 0, 0, null);
                }
                else
                {
                    if (InstanceManager.Game.Roles.HasRight(mUserInfo.iRole, "fuse_use_club_dance"))
                    {
                        int danceId = ArgumentEncoding.decodeInt(mPacketBody);
                        if (danceId >= 0 && danceId <= 4)
                        {
                            mRoomInstance.RemoveUniqueStatuses(mSessionID, "");
                            ApplyUniqueStatus("dance", 0, danceId.ToString(), true, 0, 0, null);
                        }
                    }
                }
            }
        }

        //94 - "WAVE": "A^"
        public void Listener94()
        {
            if (!mRoomInstance.HasUniqueStatus(mSessionID, "swim"))
            {
                mRoomInstance.RemoveUniqueStatuses(mSessionID, "carryd");
                ApplyUniqueStatus("wave", 2, null, true, 0, 0, null);
            }
        }

        //95 - "KICKUSER": "A_"
        public void Listener95()
        {
            RoomUser thisUser = mRoomInstance.GetUser(mSessionID);
            RoomUser kickUser = mRoomInstance.GetUser(mPacketBody);
            if (thisUser.HasAdmin || thisUser.HasRights)
            {
                if (kickUser != null)
                {
                    if (!kickUser.HasAdmin && !InstanceManager.Game.Roles.HasRight(kickUser.UserInfo.iRole, "fuse_cannot_get_kicked"))
                    {
                        mMessage.Init(18); // @R
                        mRoomInstance.SendMessage(mMessage, kickUser.SessionID);

                        mRoomInstance.RemoveUser(kickUser.SessionID);
                    }
                }
            }
        }

        //115 - "GOAWAY": "As"
        public void Listener115()
        {
            mMessage.Init(18); // @R
            SendMessage(mMessage);

            mRoomInstance.RemoveUser(mSessionID);
        }

        //126 - "GETROOMAD": "A~"
        public void Listener126()
        {

        }

        //158 - "SETBADGE": "B^"
        public void Listener158()
        {
            int badgeLen = Base64Encoding.DecodeInt(mPacketBody.Substring(0, 2));
            string badge = mPacketBody.Substring(2, badgeLen);
            if (ArgumentEncoding.decodeInt(mPacketBody.Substring(mPacketBody.Length - 1, 1)) == 1)
            {
                if (mUserInfo.Badges.Contains(badge))
                {
                    mUserInfo.sBadge = badge;
                }
            }
            else
            {
                if (mUserInfo.sBadge == badge)
                {
                    mUserInfo.sBadge = "";
                }
            }

            InstanceManager.Game.Users.SetBadge(mUserInfo.userId, mUserInfo.sBadge);

            mUserInfo = InstanceManager.Game.Users.GetUser(mUserInfo.userId);

            mMessage.Init(228); //Cd
            mMessage.appendArgumentInt(mRoomInstance.GetUser(mSessionID).RoomUserID);
            mMessage.appendString(mUserInfo.sBadge);
            mMessage.appendChar(2);
            mRoomInstance.RoomBroadcast(mMessage);
        }

        public void ApplyUniqueStatus(string statusName, int statusTime, string customData, bool canWalk, int actionDelay, int actionLength, string action)
        {
            RoomUser user = mRoomInstance.GetUser(mSessionID);
            if (!user.SpecialStates.ContainsKey(statusName))
            {
                user.SpecialStates.Add(statusName, new RoomUser.RoomUserStatus(statusName, canWalk, customData, statusTime, actionDelay, actionLength, action, true));
            }
        }

        private void ApplyEmotes(string chat)
        {
            string[] emotes = Users.UserSettings.UserEmotes.Split('|');

            foreach (string emote in emotes)
            {
                string emoteType = emote.Split('*')[0];
                string[] triggers = emote.Split('*')[1].Split(',');

                foreach (string trigger in triggers)
                {
                    if (chat.Contains(trigger))
                    {
                        ApplyUniqueStatus("gest", 5, emoteType, true, 0, 0, null);
                    }
                }
            }
        }

    }
}
