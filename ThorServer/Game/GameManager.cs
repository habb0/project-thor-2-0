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
using ThorServer.Game.Messenger;
using ThorServer.Game.Rooms;
using ThorServer.Game.Misc;
using ThorServer.Game.Furni;
using ThorServer.Game.Moderation;
using ThorServer.Game.Catalogue;
using ThorServer.Game.External;

namespace ThorServer.Game
{
    public class GameManager
    {
        private UserManager mUserManager;
        private RoleManager mRoleManager;
        private MessengerManager mMessengerManager;
        private RoomManager mRoomManager;
        private Navigator mNavigator;
        private MiscManager mMiscManager;
        private FurniManager mFurniManager;
        private ModerationHandler mModerationHandler;
        private CatalogueManager mCatalogueManager;
        private ExternalManager mExternalManager;

        public GameManager()
        {
            mUserManager = new UserManager();
            mRoleManager = new RoleManager();
            mMessengerManager = new MessengerManager();
            mRoomManager = new RoomManager();
            mNavigator = new Navigator();
            mMiscManager = new MiscManager();
            mFurniManager = new FurniManager();
            mModerationHandler = new ModerationHandler();
            mCatalogueManager = new CatalogueManager();
            mExternalManager = new ExternalManager();
        }

        public UserManager Users
        {
            get
            {
                return mUserManager;
            }
        }

        public RoleManager Roles
        {
            get
            {
                return mRoleManager;
            }
        }

        public MessengerManager Messenger
        {
            get
            {
                return mMessengerManager;
            }
        }

        public RoomManager Rooms
        {
            get
            {
                return mRoomManager;
            }
        }

        public Navigator Navigator
        {
            get
            {
                return mNavigator;
            }
        }

        public MiscManager Misc
        {
            get
            {
                return mMiscManager;
            }
        }

        public FurniManager Furni
        {
            get
            {
                return mFurniManager;
            }
        }

        public ModerationHandler Moderation
        {
            get
            {
                return mModerationHandler;
            }
        }

        public CatalogueManager Catalogue
        {
            get
            {
                return mCatalogueManager;
            }
        }

        public ExternalManager Externals
        {
            get
            {
                return mExternalManager;
            }
        }
    }
}
