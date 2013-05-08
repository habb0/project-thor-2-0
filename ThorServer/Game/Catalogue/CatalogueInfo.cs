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

namespace ThorServer.Game.Catalogue
{
    public class CatalogueItemInfo
    {
        public string FurniSprite;
        public string FurniName;
        public string FurniDesc;
        public int W;
        public int L;
        public string Col;
        public int ItemCost;
        public string PurchaseCode;
        public bool WallItem;
        public string HandType;
        public int FurniType;
        public bool Sticky;
        public bool StaffOnly;
    }

    public class CataloguePage
    {
        public int PageId;
        public string PageName;
        public string PageVisibleName;
        public int PageOrder;
        public string PageLayout;
        public string PageImageTitle;
        public string PageSideImage;
        public string PageDescription;
        public string PageLabel;
        public string PageAdditional;
        public bool StaffOnly;
    }
}
