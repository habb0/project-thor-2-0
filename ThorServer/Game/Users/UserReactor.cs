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


namespace ThorServer.Game.Users
{
    public class UserReactor : Reactor
    {

        //7 - "GET_INFO": "@G"
        public void Listener7()
        {
            mMessage.Init(5); //@E
            mMessage.appendString(mUserInfo.buildUserObject());
            SendMessage(mMessage);
        }

        //8 - "GET_CREDITS": "@H"
        public void Listener8()
        {
            mMessage.Init(6); //@F
            mMessage.appendString(mUserInfo.iCredits.ToString() + ".0");
            SendMessage(mMessage);
        }

        //26 - "SCR_GET_USER_INFO": "@Z"
        public void Listener26()
        {
            mMessage.Init(7); //@G
            mMessage.appendString("club_habbo");
            mMessage.appendChar(2);
            mMessage.appendArgumentInt(mUserInfo.ClubDaysRemaining);
            mMessage.appendArgumentInt(mUserInfo.ClubMonthsPassed);
            mMessage.appendArgumentInt(mUserInfo.ClubMonthsRemaining);
            mMessage.appendArgumentInt(1);
            SendMessage(mMessage);
        }

        //44 - "UPDATE": "@l"
        public void Listener44()
        {
            string newFigure = FuseMessage.getStructured(4, mPacketBody);
            string newSex = FuseMessage.getStructured(5, mPacketBody);
            string newMission = FuseMessage.getStructured(6, mPacketBody);
            UserInfo userInfo = InstanceManager.Game.Users.GetUser(mUserInfo.userId);
            if (newFigure != "") userInfo.sFigure = newFigure;
            if (newSex != "") userInfo.sSex = newSex;
            if (newMission != "") userInfo.sMission = newMission;
            InstanceManager.Game.Users.UpdateUser(userInfo);
            mUserInfo = InstanceManager.Game.Users.GetUser(userInfo.userId);
            InstanceManager.Sessions.GetSession(mSessionID).UpdateUserInfo(mUserInfo);
            mMessage.Init(5); //@E
            mMessage.appendString(mUserInfo.buildUserObject());
            SendMessage(mMessage);
        }

        //149 - "UPDATE_ACCOUNT": "BU"
        public void Listener149()
        {
            string newEmail = FuseMessage.getStructured(7, mPacketBody);
            UserInfo userInfo = InstanceManager.Game.Users.GetUser(mUserInfo.userId);
            userInfo.sEmail = newEmail;
            InstanceManager.Game.Users.UpdateUser(userInfo);
            mUserInfo = InstanceManager.Game.Users.GetUser(userInfo.userId);
            InstanceManager.Sessions.GetSession(mSessionID).UpdateUserInfo(mUserInfo);
            mMessage.Init(169); //Bi
            mMessage.appendInt(0);
            SendMessage(mMessage);
        }

        //157 - "GETAVAILABLEBADGES": "B]"
        public void Listener157()
        {
            int badgeCount = InstanceManager.Game.Roles.GetBadgeCount(mUserInfo.iRole);

            mMessage.Init(229); //Ce
            mMessage.appendString(ArgumentEncoding.encodeInt(badgeCount));

            int currentBadge = 0;
            int currentIt = 0;

            if (badgeCount > 0)
            {
                mUserInfo.Badges = InstanceManager.Game.Roles.GetBadges(mUserInfo.iRole);

                foreach (string badge in mUserInfo.Badges)
                {
                    mMessage.appendString(badge);
                    mMessage.appendChar(2);

                    if (badge == mUserInfo.sBadge)
                    {
                        currentBadge = currentIt;
                    }

                    currentIt++;
                }
            }
            
            mMessage.appendArgumentInt(currentBadge);
            
            if (currentBadge > 0)
            {
                mMessage.appendArgumentInt(1);
            }
            else
            {
                mMessage.appendArgumentInt(0);
            }

            SendMessage(mMessage);
        }

        //203 - "APPROVE_PASSWORD": "CK"
        public void Listener203()
        {
                string newPassword = FuseMessage.getArgument(2, mPacketBody);
                UserInfo userInfo = InstanceManager.Game.Users.GetUser(mUserInfo.userId);
                userInfo.sPassword = newPassword;
                InstanceManager.Game.Users.UpdateUser(userInfo);
                mUserInfo = InstanceManager.Game.Users.GetUser(userInfo.userId);
                InstanceManager.Sessions.GetSession(mSessionID).UpdateUserInfo(mUserInfo);
                mMessage.Init(169); //Bi
                mMessage.appendInt(0);
                SendMessage(mMessage);
        }
    }
}
