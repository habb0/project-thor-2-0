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

using ThorServer.Game.Users;
using ThorServer.Game.Rooms;

namespace ThorServer.Game.Moderation
{
    public partial class ModerationHandler
    {
        private int callCurrentID = 0;
        private Dictionary<int, CallForHelpInfo> mCalls = new Dictionary<int,CallForHelpInfo>();

        public void CallForHelp(RoomUser user, RoomInfo room, string callBody)
        {
            
            
            CallForHelpInfo cfh = new CallForHelpInfo();
            cfh.CallId = callCurrentID++;
            cfh.Caller = user.UserInfo.sUsername;
            cfh.CallerId = user.UserInfo.userId;
            cfh.Message = callBody;
            cfh.PickedUpBy = "";
            cfh.Priority = 2;
            cfh.RoomId = room.RoomID;
            cfh.RoomName = room.RoomName;

            mCalls.Add(cfh.CallId, cfh);

            SendCFH(cfh);
        }

        public void PickupCallForHelp(int callid, UserInfo user)
        {
            if (InstanceManager.Game.Roles.HasRight(user.iRole, "fuse_cfh"))
            {
                if (mCalls.ContainsKey(callid))
                {
                    mCalls[callid].PickedUpBy = user.sUsername;
                    SendCFH(mCalls[callid]);
                }
            }
        }

        public void ReplyCallForHelp(int callid, string message, UserInfo user)
        {
            if (InstanceManager.Game.Roles.HasRight(user.iRole, "fuse_cfh"))
            {
                if (mCalls.ContainsKey(callid))
                {
                    long sessionId = InstanceManager.Sessions.GetSessionFromUser(mCalls[callid].CallerId);

                    if (sessionId != -1)
                    {
                        mMessage.Init(33); // @a
                        mMessage.appendString("mod_warn/");
                        mMessage.appendString(message);
                        InstanceManager.Sessions.GetSession(sessionId).SendMessage(mMessage);
                    }
                }
            }
        }

        public void UpgradeCFH(int callid, int priority, UserInfo user)
        {
            if (InstanceManager.Game.Roles.HasRight(user.iRole, "fuse_cfh"))
            {
                if (mCalls.ContainsKey(callid))
                {
                    mCalls[callid].Priority = priority;
                    SendCFH(mCalls[callid]);
                }
            }
        }

        private void SendCFH(CallForHelpInfo cfh)
        {
            mMessage.Init(148); //BT
            mMessage.appendArgumentInt(cfh.CallId);
            mMessage.appendChar(2);
            mMessage.appendArgumentInt(cfh.Priority);
            mMessage.appendString("Picked up by: ");
            mMessage.appendString(cfh.PickedUpBy);
            mMessage.appendChar(2);
            mMessage.appendString(cfh.Caller);
            mMessage.appendChar(2);
            mMessage.appendString(cfh.Message);
            mMessage.appendChar(2);
            mMessage.appendString("M");
            mMessage.appendChar(2);
            mMessage.appendString("Room: ");
            mMessage.appendString(cfh.RoomName);
            mMessage.appendChar(2);
            mMessage.appendString("I");
            mMessage.appendChar(2);
            mMessage.appendArgumentInt(cfh.RoomId);
            mMessage.appendChar(2);

            InstanceManager.Sessions.BroadcastCallForHelp(mMessage);
        }


        public class CallForHelpInfo
        {
            public int CallId;
            public string Caller;
            public int CallerId;
            public string Message;
            public int RoomId;
            public string RoomName;
            public int Priority = 0;
            public string PickedUpBy;
        }
    }
}