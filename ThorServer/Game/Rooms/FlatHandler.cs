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

using ThorServer.Utilities;
using ThorServer.Core;
using ThorServer.Game.Rooms.Interactor;

namespace ThorServer.Game.Rooms
{
    public partial  class RoomInstance
    {
        private ClientMessage mMessage = new ClientMessage();

        public void SendUserList(long sessionId)
        {
            
            if (mRoomUsers != null && mRoomUsers.Count > 0)
            {

                Dictionary<long, RoomUser>.Enumerator myEnum = mRoomUsers.GetEnumerator();

                while (myEnum.MoveNext())
                {
                    if (myEnum.Current.Value != null)
                    {
                        mMessage.Init(28); //@\
                        mMessage.appendString(GetUserEntryPacket(myEnum.Current.Key));
                        SendMessage(mMessage, sessionId);
                    }

                }
            }
            else
            {
                mMessage.Init(28); //@\
                SendMessage(mMessage, sessionId);
            }
        }

        private string GetUserEntryPacket(long sessionId)
        {
            StringBuilder sb = new StringBuilder();
            RoomUser nUser = mRoomUsers[sessionId];

            if (nUser != null)
            {

                sb.Append("i:" + nUser.RoomUserID + Convert.ToChar(13));
                sb.Append("n:" + nUser.UserInfo.sUsername + Convert.ToChar(13));
                sb.Append("f:" + nUser.UserInfo.sFigure + Convert.ToChar(13));
                sb.Append("l:" + nUser.CurrentX + " " + nUser.CurrentY + " " + nUser.CurrentZ + Convert.ToChar(13));
                sb.Append("s:" + nUser.UserInfo.sSex + Convert.ToChar(13));
                sb.Append("c:" + nUser.UserInfo.sMission + Convert.ToChar(13));
                if (nUser.UserInfo.sBadge != "")
                {
                    sb.Append("b:" + nUser.UserInfo.sBadge + Convert.ToChar(13));
                }
                if (RoomInfo.ReactorType == "PoolReactor" || RoomInfo.ReactorType == "LidoReactor" || RoomInfo.ReactorType == "RooftopReactor")
                {
                    if (nUser.UserInfo.sPoolFigure != "")
                    {
                        sb.Append("p:" + nUser.UserInfo.sPoolFigure);
                    }
                }
            }

            return sb.ToString();
        }

        public void AnnounceUser(long sessionId)
        {
            ClientMessage mMessage = new ClientMessage();
            string pBody = GetUserEntryPacket(sessionId);
            mMessage.Init(28); //@\
            mMessage.appendString(pBody);
            RoomBroadcast(mMessage);
            AnnounceUserStatus(sessionId, true);

        }

        public void AnnounceUserStatus(long sessionId, bool forceUpdate)
        {
            string pStatus = BuildUserStatus(sessionId, forceUpdate);
            if (pStatus != null)
            {
                mMessage.Init(34); //@b
                mMessage.appendString(pStatus);
                RoomBroadcast(mMessage);
            }
        }

        private void SendUserStatus(long sessionId, bool forceUpdate, long sendTo)
        {
            string pStatus = BuildUserStatus(sessionId, forceUpdate);
            if (pStatus != null)
            {
                mMessage.Init(34); //@b
                mMessage.appendString(pStatus);
                SendMessage(mMessage, sendTo);
            }
        }

        public void RemoveUniqueStatuses(long sessionId, string exceptions)
        {
            string[] remove = "dance,wave,carryd,swim".Split(',');
            string[] exception = exceptions.Split(',');

            foreach (string removeThis in remove)
            {
                bool isAllowed = false;
                foreach (string removeException in exception)
                {
                    if (removeThis == removeException)
                    {
                        isAllowed = true;
                    }
                }

                if (!isAllowed)
                {
                    RemoveUniqueStatus(sessionId, removeThis);
                }
            }
        }

        public void RemoveUniqueStatus(long sessionId, string status)
        {
            RoomUser user = GetUser(sessionId);

            if (user != null)
            {
                if (user.SpecialStates.ContainsKey(status))
                {
                    user.SpecialStates.Remove(status);
                }

                user.MustUpdate = true;
            }   
        }

        public bool HasUniqueStatus(long sessionId, string status)
        {
            RoomUser user = GetUser(sessionId);
            return user.SpecialStates.ContainsKey(status);
        }

        public void MakeTalk(long sessionId, string chat)
        {
            RemoveUniqueStatus(sessionId, "talk");
            int talkLen = 1;
            int numWords = chat.Split(' ').Length;
            if (numWords > 1) talkLen = numWords / 2;
            if (talkLen > 5) talkLen = 5;

            RoomUser user = GetUser(sessionId);
            user.SpecialStates.Add("talk", new RoomUser.RoomUserStatus("talk", true, "", talkLen, 0, 0, null, true));
        }

        public string BuildUserStatus(long sessionID, bool forceRefresh)
        {
            bool isUpdate = false;
            RoomUser nUser = GetUser(sessionID);

            StringBuilder postStatus = new StringBuilder();

            if (nUser.IsMoving)
            {
                postStatus.Append("/mv ");
                postStatus.Append(nUser.NextX.ToString());
                postStatus.Append(",");
                postStatus.Append(nUser.NextY.ToString());
                postStatus.Append(",");
                postStatus.Append(nUser.NextZ.ToString());
            }

            if (nUser.SpecialStates.Count > 0)
            {
                Dictionary<string, RoomUser.RoomUserStatus>.Enumerator myEnum = nUser.SpecialStates.GetEnumerator();
                List<string> statusesToRemove = new List<string>();
                isUpdate = true;
                while (myEnum.MoveNext())
                {
                    if (myEnum.Current.Value.IsStillValid())
                    {
                        if (myEnum.Current.Value.IsVisible)
                        {
                            if ((nUser.IsMoving == false) || (nUser.IsMoving && myEnum.Current.Value.CanWalkWithStatus))
                            {
                                postStatus.Append("/");
                                postStatus.Append(myEnum.Current.Value.StatusName);
                                if (myEnum.Current.Value.CustomData != null)
                                {
                                    postStatus.Append(" ");
                                    postStatus.Append(myEnum.Current.Value.CustomData);
                                }
                            }
                            else
                            {
                                statusesToRemove.Add(myEnum.Current.Key);
                            }
                        }

                    }
                    else
                    {
                        statusesToRemove.Add(myEnum.Current.Key);
                    }
                }

                foreach (string delStatus in statusesToRemove)
                {
                    nUser.SpecialStates.Remove(delStatus);
                }
            }

            StringBuilder userStatus = new StringBuilder();
            userStatus.Append(nUser.RoomUserID.ToString());
            userStatus.Append(" ");
            userStatus.Append(nUser.CurrentX);
            userStatus.Append(",");
            userStatus.Append(nUser.CurrentY);
            userStatus.Append(",");
            userStatus.Append(nUser.CurrentZ.ToString().Replace(',','.'));
            userStatus.Append(",");
            userStatus.Append(nUser.HeadDirection);
            userStatus.Append(",");
            userStatus.Append(nUser.BodyDirection);
            userStatus.Append(postStatus);

            if (isUpdate || forceRefresh || nUser.MustUpdate)
            {
                nUser.MustUpdate = false;
                string newStatus = userStatus.ToString();

                if (newStatus != nUser.LastStatus || forceRefresh)
                {
                    nUser.LastStatus = newStatus;
                    return newStatus;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }
    }
}
