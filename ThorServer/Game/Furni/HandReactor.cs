using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ThorServer.Core;

namespace ThorServer.Game.Furni
{
    public class HandReactor : Reactor
    {

        private int mHandPage = 0;

        //65 - "HAND": "AA"
        public void Listener65()
        {
            switch (mPacketBody)
            {
                case "new":
                    mHandPage = 0;
                    break;

                case "next":
                    mHandPage++;
                    break;

                case "prev":
                    mHandPage--;
                    break;
            }

            SendHandInfo();
        }

        public void UpdateHandInvoker()
        {
            SendHandInfo();
        }

        private void SendHandInfo()
        {
            List<FurniInfo> furniInfo = InstanceManager.Game.Furni.GetHandFurniList(mUserInfo.userId);
            StringBuilder sb = new StringBuilder();
            int startId = 0;
            int endId = furniInfo.Count;

            if (furniInfo.Count > 0)
            {
                startId= mHandPage * 9;
                if (endId > (startId + 9)) { endId = startId + 9; }
                if (startId > endId || startId == endId) { mHandPage--; SendHandInfo(); return; }

                sb.Append("SI");


                for (int i = startId; i < endId; i++)
                {
                    FurniInfo info = furniInfo[i];

                   
                        if (!info.Flags.WallItem) //Floor Item
                        {
                            sb.Append(Convert.ToChar(30));
                            sb.Append(info.FurniID.ToString());
                            sb.Append(Convert.ToChar(30));
                            sb.Append(i.ToString());
                            sb.Append(Convert.ToChar(30));
                            sb.Append(info.HandType);
                            sb.Append(Convert.ToChar(30));
                            sb.Append(info.FurniID);
                            sb.Append(Convert.ToChar(30));
                            sb.Append(info.FurniSprite);
                            sb.Append(Convert.ToChar(30));
                            sb.Append(info.W);
                            sb.Append(Convert.ToChar(30));
                            sb.Append(info.L);
                            sb.Append(Convert.ToChar(30));
                            sb.Append(info.Col);
                            sb.Append("/");
                        }
                        else //Wall item
                        {
                            sb.Append(Convert.ToChar(30));
                            sb.Append(info.FurniID.ToString());
                            sb.Append(Convert.ToChar(30));
                            sb.Append(i.ToString());
                            sb.Append(Convert.ToChar(30));
                            sb.Append(info.HandType);
                            sb.Append(Convert.ToChar(30));
                            sb.Append(info.FurniID.ToString());
                            sb.Append(Convert.ToChar(30));
                            sb.Append(info.FurniSprite);
                            sb.Append(Convert.ToChar(30));
                            if (info.Flags.StickyNote || info.Flags.Decoration)
                            {
                                sb.Append(info.FurniVar);
                            }
                            else
                            {
                                sb.Append(info.Col);
                            }
                            sb.Append("/");
                        }
                }               
            
            }
            

            mMessage.Init(140); //BL
            mMessage.appendString(sb.ToString());
            mMessage.appendChar(13);
            mMessage.appendInt(furniInfo.Count);
            SendMessage(mMessage);

        }
    }
}
