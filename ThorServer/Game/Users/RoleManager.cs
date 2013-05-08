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
using System.Data;

using ThorServer.Data;

namespace ThorServer.Game.Users
{
    public class RoleManager
    {
        public bool HasRight(int roleId, string right)
        {
            StringBuilder sb = new StringBuilder();
            bool hasParent = true;

            sb.Append(roleId);

            Database db = new Database();

            while (hasParent)
            {
                db.sqlexecute.Parameters.AddWithValue("@roleid", roleId);
                roleId = db.getInt("SELECT InheritRole FROM Roles WHERE RoleID = @roleid;");
                db.sqlexecute.Parameters.Clear();

                if (roleId > 0)
                {
                    sb.Append(", " + roleId.ToString());
                }
                else
                {
                    hasParent = false;
                }
            }

            db.sqlexecute.Parameters.AddWithValue("@rightname", right);
            int tmpRole = db.getInt("SELECT COUNT(*) FROM RoleAccess WHERE RoleID IN (" + sb.ToString() + ") AND RightName = @rightname;");
            return (tmpRole > 0);
        }

        public Dictionary<int, string> GetRoles()
        {
            Dictionary<int, string> results = new Dictionary<int, string>();
            Database db = new Database();

            DataTable dTable = db.GetDataSet("SELECT * FROM Roles").Tables[0];

            foreach (DataRow row in dTable.Rows)
            {
                results.Add((int)row["RoleID"], row["RoleName"].ToString());
            }
            return results;
        }

        public List<string> GetRights(int roleId)
        {
            List<string> results = new List<string>();
            bool hasParent = true;
            Database db = new Database();

            while (hasParent)
            {
                db.sqlexecute.Parameters.AddWithValue("@roleid", roleId);
                DataTable dTable = db.GetDataSet("SELECT * FROM RoleAccess WHERE RoleID = @roleid").Tables[0];
                db.sqlexecute.Parameters.Clear();

                foreach (DataRow dRow in dTable.Rows)
                {
                    results.Add(dRow["RightName"].ToString());
                }


                db.sqlexecute.Parameters.AddWithValue("@roleid", roleId);
                roleId = db.getInt("SELECT InheritRole FROM Roles WHERE RoleID = @roleid;");
                db.sqlexecute.Parameters.Clear();

                if (roleId == 0)
                {
                    hasParent = false;
                }
            }

            return results;
        }

        public string GenerateRightsList(int roleid)
        {
            List<string> roleList = GetRights(roleid);
            StringBuilder sb = new StringBuilder();

            foreach (string right in roleList)
            {
                sb.Append(right);
                sb.Append(Convert.ToChar(2));
            }

            return sb.ToString();
        }

        public bool HasBadge(int roleId, string badge)
        {
            StringBuilder sb = new StringBuilder();
            bool hasParent = true;

            sb.Append(roleId);

            Database db = new Database();

            while (hasParent)
            {
                db.sqlexecute.Parameters.AddWithValue("@roleid", roleId);
                roleId = db.getInt("SELECT InheritRole FROM Roles WHERE RoleID = @roleid;");
                db.sqlexecute.Parameters.Clear();

                if (roleId > 0)
                {
                    sb.Append(", " + roleId.ToString());
                }
                else
                {
                    hasParent = false;
                }
            }

            db.sqlexecute.Parameters.AddWithValue("@badgename", badge);
            int tmpRole = db.getInt("SELECT COUNT(*) FROM Badges WHERE RoleID IN (" + sb.ToString() + ") AND BadgeName = @badgename;");
            return (tmpRole > 0);
        }

        public int GetBadgeCount(int roleId)
        {
            StringBuilder sb = new StringBuilder();
            bool hasParent = true;

            sb.Append(roleId);

            Database db = new Database();

            while (hasParent)
            {
                db.sqlexecute.Parameters.AddWithValue("@roleid", roleId);
                roleId = db.getInt("SELECT InheritRole FROM Roles WHERE RoleID = @roleid;");
                db.sqlexecute.Parameters.Clear();

                if (roleId > 0)
                {
                    sb.Append(", " + roleId.ToString());
                }
                else
                {
                    hasParent = false;
                }
            }

            int tmpRole = db.getInt("SELECT COUNT(*) FROM Badges WHERE RoleID IN (" + sb.ToString() + ");");
            return tmpRole;
        }

        public List<string> GetBadges(int roleId)
        {
            List<string> results = new List<string>();
            bool hasParent = true;
            Database db = new Database();

            while (hasParent)
            {
                db.sqlexecute.Parameters.AddWithValue("@roleid", roleId);
                DataTable dTable = db.GetDataSet("SELECT * FROM Badges WHERE RoleID = @roleid").Tables[0];
                db.sqlexecute.Parameters.Clear();

                foreach (DataRow dRow in dTable.Rows)
                {
                    results.Add(dRow["BadgeName"].ToString());
                }


                db.sqlexecute.Parameters.AddWithValue("@roleid", roleId);
                roleId = db.getInt("SELECT InheritRole FROM Roles WHERE RoleID = @roleid;");
                db.sqlexecute.Parameters.Clear();

                if (roleId == 0)
                {
                    hasParent = false;
                }
            }

            return results;
        }

        public string GenerateBadgeList(int roleid)
        {
            List<string> badgeList = GetBadges(roleid);
            StringBuilder sb = new StringBuilder();

            foreach (string badge in badgeList)
            {
                sb.Append(badge);
                sb.Append(Convert.ToChar(2));
            }

            return sb.ToString();
        }
    }
}
