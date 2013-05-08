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
using System.Drawing;
using System.Timers;

using ThorServer.Game.Furni;
using ThorServer.Core;
using ThorServer.Utilities;
using ThorServer.Game.Rooms;
using ThorServer.Game.Rooms.Pathfinding;

namespace ThorServer.Game.Rooms.Interactor
{
    public partial class RoomInteractor
    {
        private void GenerateMaps()
        {
            //Get information about the default heightmap
            string[] lines = mDefaultHeightmap.Split(Convert.ToChar(13));
            int y = lines.Length;
            int x = lines[0].Length;

            //Client heightmap
            string[,] theMap = new string[x, y];
            string[,] theOldMap = new string[x, y];

            //Pathfinding info
            byte[,] theMatrix = new byte[SpecialMath.NearestSuperiorPowerOfTwo(x), SpecialMath.NearestSuperiorPowerOfTwo(y)];

            //Heightmap
            float[,] hMap = new float[x, y];

            //Redirect map for beds
            Point[,] redirectMap = new Point[x, y];

            //Rollers
            bool enableRollers = false;

            //Translate the default map into data thor can understand
            for (int line = 0; line < y; line++)
            {
                for (int chr = 0; chr < x; chr++)
                {
                    float tileZ = 0;
                    string tileValue = lines[line].Substring(chr, 1);
                    theMap[chr, line] = tileValue;

                    if (float.TryParse(tileValue, out tileZ))
                    {
                        theMatrix[chr, line] = 1;
                        hMap[chr, line] = tileZ;
                    }
                    else
                    {
                        theMatrix[chr, line] = 0;
                    }

                    redirectMap[chr, line] = new Point(chr, line);
                }
            }
            theOldMap = theMap;

            //Loop over the furniture and update heightmap and pathfinder
            foreach (FurniInfo info in mFloorFurni)
            {
                //If this is the highest item on the tile, set the heightmap
                if (info.TotalHeight > hMap[info.PosX, info.PosY]) hMap[info.PosX, info.PosY] = info.TotalHeight;

                //If the item isn't pathable, block the tile
                if (!info.Flags.CanPath) theMatrix[info.PosX, info.PosY] = 0;

                //If the item isn't stackable or interactable, we should tell the client
                if (!info.Flags.CanStackOn && !info.PublicFurni && !info.Flags.CanSit && !info.Flags.CanLay && !info.Flags.CanStand) if (hMap[info.PosX, info.PosY] == 0) { theMap[info.PosX, info.PosY] = "A"; }

                //If the item is a roller, set the weight higher so users avoid walking on them
                if (info.Flags.IsRoller && theMatrix[info.PosX, info.PosY] != 0) theMatrix[info.PosX, info.PosY] = 5;

                //Get a list of tiles this furniture currently resides on
                Dictionary<int, AffectedTile> pointList = GetAffectedTiles(info);

                //Loop over the affected tiles and essentially do what we did above
                foreach (AffectedTile point in pointList.Values)
                {
                    //If this is the highest item on the tile, set the heightmap
                    if (info.TotalHeight > hMap[point.X, point.X]) hMap[point.X, point.Y] = info.TotalHeight;

                    //If the item isn't pathable, block the tile
                    if (!info.Flags.CanPath) theMatrix[point.X, point.Y] = 0;

                    //If the item isn't stackable or interactable, we should tell the client
                    if (!info.Flags.CanStackOn && !info.PublicFurni && !info.Flags.CanSit && !info.Flags.CanLay && !info.Flags.CanStand) if (hMap[point.X, point.Y] == 0) { theMap[point.X, point.Y] = "A"; }

                    //If this is a bed, we need to redirect the tile to the top
                    if (info.Flags.TopRow)
                    {
                        if (info.PosRotation == 0 || info.PosRotation == 4)
                        {
                            redirectMap[point.X, point.Y].Y = info.PosY;
                        }

                        if (info.PosRotation == 2 || info.PosRotation == 6)
                        {
                            redirectMap[point.X, point.Y].X = info.PosX;
                        }
                    }
                }
            }

            //Second loop, to handle special exceptions and client heightmap generation
            foreach (FurniInfo info in mFloorFurni)
            {
                //Is this furniture at the top of the tile?
                if (info.TotalHeight == hMap[info.PosX, info.PosY])
                {
                    //Can we stack on it? If so, the client tile height should be equal to it
                    if (info.Flags.CanStackOn)
                    {
                        theMap[info.PosX, info.PosY] = ((int)Math.Round(info.TotalHeight)).ToString();

                    }
                }

                //Get a list of tiles this furniture currently resides on
                Dictionary<int, AffectedTile> pointList = GetAffectedTiles(info);

                //Loop over the affected tiles and essentially do what we did above
                foreach (AffectedTile point in pointList.Values)
                {
                    //Is this furniture at the top of the tile?
                    if (info.TotalHeight == hMap[point.X, point.Y])
                    {
                        //Can we stack on it? If so, the client tile height should be equal to it
                        if (info.Flags.CanStackOn)
                        {
                            theMap[point.X, point.Y] = ((int)Math.Round(info.TotalHeight)).ToString();
                        }
                    }
                }



                //Is it a door divder? If it is, update the pathfinder with the correct value
                if (info.VarType == FurniInfo.VarTypes.DoorDivider)
                {
                    theMatrix[info.PosX, info.PosY] = 0;

                    //Open ?
                    if (info.FurniVar == "O")
                        theMatrix[info.PosX, info.PosY] = 1;
                }

                //Is it a chair? If it is, drop the tile to the lowest possible
                if (info.Flags.CanSit && !info.PublicFurni)
                {
                    hMap[info.PosX, info.PosY] = int.Parse(theOldMap[info.PosX, info.PosY]);

                    //Get a list of tiles this furniture currently resides on
                    pointList = GetAffectedTiles(info);

                    //Loop over the affected tiles and essentially do what we did above
                    foreach (AffectedTile point in pointList.Values)
                    {
                        hMap[point.X, point.Y] = int.Parse(theOldMap[info.PosX, info.PosY]);
                    }
                }
            }

            //Do one final loop to handle rollers
            foreach (FurniInfo info in mFloorFurni)
            {
                //Roller ?
                if (info.Flags.IsRoller)
                {
                    enableRollers = true;
                    theMap[info.PosX, info.PosY] = theOldMap[info.PosX, info.PosY];
                }


            }

            //Update the real maps!
            mClientMap = theMap;
            mMatrix = theMatrix;
            mHeightMap = hMap;
            mRedirectMap = redirectMap;
            mHasRollers = enableRollers;
        }

        private string CreatePlaintextClientHeightmap()
        {
            StringBuilder sb = new StringBuilder();
            for (int j = 0; j <= mClientMap.GetUpperBound(1); j++)
            {
                for (int i = 0; i <= mClientMap.GetUpperBound(0); i++)
                {
                    sb.Append(mClientMap[i, j]);
                }
                sb.Append(Convert.ToChar(13));
            }

            return sb.ToString();
        }

        private bool InteractiveTile(int X, int Y)
        {
            List<FurniInfo> furni = GetFurniObjects(X, Y);

            if (furni != null)
            {
                foreach (FurniInfo info in furni)
                {
                    if (info.Flags.CanSit || info.Flags.CanLay || info.Flags.CanStand)
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        private Dictionary<int, AffectedTile> GetAffectedTiles(FurniInfo info)
        {
            return GetAffectedTiles(info.L, info.W, info.PosX, info.PosY, info.PosRotation);
        }

        private Dictionary<int, AffectedTile> GetAffectedTiles(int FurniL, int FurniW, int PosX, int PosY, int PosRotation)
        {
            int x = 0;
            Dictionary<int, AffectedTile> pointList = new Dictionary<int, AffectedTile>();
            if (FurniL > 1)
            {
                if (PosRotation == 0 || PosRotation == 4) //Y Axis + W
                {
                    for (int i = 1; i < FurniL; i++)
                    {
                        pointList.Add(x++, new AffectedTile(PosX, PosY + i, i));

                        for (int j = 1; j < FurniW; j++)
                        {
                            pointList.Add(x++, new AffectedTile(PosX + j, PosY + i, (i < j) ? j : i));
                        }
                    }
                }
                else if (PosRotation == 2 || PosRotation == 6) //X Axis + W
                {
                    for (int i = 1; i < FurniL; i++)
                    {
                        pointList.Add(x++, new AffectedTile(PosX + i, PosY, i));

                        for (int j = 1; j < FurniW; j++)
                        {
                            pointList.Add(x++, new AffectedTile(PosX + i, PosY + j, (i < j) ? j : i));
                        }
                    }
                }
            }

            if (FurniW > 1)
            {
                if (PosRotation == 0 || PosRotation == 4) //X Axis + L
                {
                    for (int i = 1; i < FurniW; i++)
                    {
                        pointList.Add(x++, new AffectedTile(PosX + i, PosY, i));

                        for (int j = 1; j < FurniL; j++)
                        {
                            pointList.Add(x++, new AffectedTile(PosX + i, PosY + j, (i < j) ? j : i));

                        }
                    }
                }
                else if (PosRotation == 2 || PosRotation == 6) //Y Axis + L
                {
                    for (int i = 1; i < FurniW; i++)
                    {
                        pointList.Add(x++, new AffectedTile(PosX, PosY + i, i));
                        for (int j = 1; j < FurniL; j++)
                        {
                            pointList.Add(x++, new AffectedTile(PosX + j, PosY + i, (i < j) ? j : i));

                        }
                    }
                }
            }

            return pointList;
        }

        public string ClientMap
        {
            get
            {
                return CreatePlaintextClientHeightmap();
            }
        }

        public void FreeTile(int x, int y)
        {
            mPlayerMap[x, y] = false;
        }

        private bool ValidTile(int X, int Y)
        {
            if (X < mHeightMap.GetLowerBound(0) || Y < mHeightMap.GetLowerBound(1)) return false;
            if (X > mHeightMap.GetUpperBound(0) || Y > mHeightMap.GetUpperBound(1)) return false;
            return true;
        }

        private bool TileCheck(int X, int Y, byte[,] matrix)
        {
            if (!ValidTile(X, Y)) return false;
            bool badTile = false;

            if (matrix[X, Y] == 0) badTile = true;
            if (PlayerCheck(X, Y)) badTile = true;

            return !badTile;
        }

        private bool PlayerCheck(int X, int Y)
        {
            if (!ValidTile(X, Y)) return true;
            if (mPlayerMap[X, Y] == true) return true;
            return false;
        }

        public bool TilesTouching(int X1, int Y1, int X2, int Y2)
        {
            if (!(Math.Abs(X1 - X2) > 1 || Math.Abs(Y1 - Y2) > 1)) return true;
            if (X1 == X2 && Y1 == Y2) return true;
            return false;
        }
    }
}
