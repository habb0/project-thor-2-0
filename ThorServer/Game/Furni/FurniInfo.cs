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

namespace ThorServer.Game.Furni
{
    public class FurniInfo
    {
        public string FurniName;
        public string FurniDesc;
        public int FurniID;
        public string FurniSprite;
        public string FurniFlags;
        public FurniBehaviour Flags = new FurniBehaviour();
        public int FurniDefinitionID;
        public int W;
        public int L;
        public string Col;
        public int PosX;
        public int PosY;
        public float PosZ;
        public int PosRotation;
        public int RoomID;
        public int OwnerID;
        public string FurniVar;
        public float HeightOffset;
        public string HandType;
        public string WallLocation;
        public VarTypes VarType;
        public int TeleportId;
        public float ActionHeight;
        public int FurniTypeId;
        public bool CanTrade;
        public bool PublicFurni;

        public float TotalHeight
        {
            get
            {
                return PosZ + HeightOffset;
            }
        }

        public enum VarTypes
        {
            CannotSign = 0,
            TempOpen = 1,
            DoorDivider = 2,
            Dice = 3,
            TrueFalse = 4,
            OnOff = 5,
            NumericalOff = 6,
            OpenOrClosed = 7,
            Bottle = 8
        }

        public void ProcessFlags()
        {
            for (int i = 0; i < FurniFlags.Length; i++)
            {
                string flag = FurniFlags.Substring(i, 1);

                switch (flag)
                {
                    case "P":
                        Flags.CanPath = true;
                        break;

                    case "S":
                        Flags.CanSit = true;
                        break;

                    case "L":
                        Flags.CanLay = true;
                        break;

                    case "M":
                        Flags.CanStack = true;
                        break;

                    case "O":
                        Flags.CanStackOn = true;
                        break;

                    case "R":
                        Flags.IsRoller = true;
                        break;

                    case "T":
                        Flags.TopRow = true;
                        break;

                    case "W":
                        Flags.CanStand = true;
                        break;

                    case "X":
                        Flags.IsTeleport= true;
                        break;

                    case "V":
                        Flags.WallItem = true;
                        break;

                    case "N":
                        Flags.StickyNote = true;
                        break;
                    
                    case "D":
                        Flags.Decoration = true;
                        break;

                    case "A":
                        Flags.AutoTeleport = true;
                        break;

                    case "C":
                        Flags.InvisibleToClient = true;
                        break;

                    case "F":
                        Flags.Doormat = true;
                        break;

                    case "G":
                        Flags.Gift = true;
                        break;

                    case "d":
                        Flags.PoolChange = true;
                        break;

                    case "e":
                        Flags.PoolEnter = true;
                        break;

                    case "f":
                        Flags.PoolExit = true;
                        break;

                    case "g":
                        Flags.NeverBlocked = true;
                        break;
                }
            }
        }

        public class FurniBehaviour
        {
            public bool CanPath = false; //P
            public bool CanSit = false; //S
            public bool CanLay = false; //L
            public bool CanStack = false; //M
            public bool CanStackOn = false; //O
            public bool IsRoller = false; //R
            public bool TopRow = false; //T
            public bool IsTeleport = false; //X
            public bool CanStand = false; //W
            public bool WallItem = false; //V
            public bool StickyNote = false; //N
            public bool Decoration = false; //D
            public bool AutoTeleport = false; //A
            public bool InvisibleToClient = false; //C
            public bool Doormat = false; //F
            public bool Gift = false; //G
            public bool PoolChange = false; //d
            public bool PoolEnter = false; //e
            public bool PoolExit = false; //f
            public bool NeverBlocked = false; //g
        }
    }

    public class GiftInfo
    {
        public int GiftId;
        public string PurchaseCode;
        public string Payload;
    }
}
