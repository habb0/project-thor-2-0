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
using System.Data;
using System.Configuration;

namespace ThorServer.Data
{
    public class Database
    {
        private System.Data.SqlClient.SqlConnection dataconnection = new System.Data.SqlClient.SqlConnection();
        private System.Data.SqlClient.SqlDataAdapter sqladapter = new System.Data.SqlClient.SqlDataAdapter();
        public System.Data.SqlClient.SqlCommand sqlexecute = new System.Data.SqlClient.SqlCommand();

        private System.Data.SqlClient.SqlDataReader sqlreader;

        string ConnectionString;
        public void SetConnectionString(string strconnection)
        {
            ConnectionString = strconnection;
        }

        public string GetConnectionString()
        {
            return ConnectionString;
        }


        public void ExecuteSQL(string strsql)
        {
            OpenDB();

            sqlexecute.CommandText = strsql;
            sqlexecute.ExecuteNonQuery();
            Close();
        }

        public bool OpenDB()
        {
            ConnectionString = "Server=" + Settings.DatabaseServer +
                                ";User ID=" + Settings.DatabaseUser +
                                ";Password=" + Settings.DatabasePassword +
                                ";Initial Catalog=" + Settings.DatabaseName +
                                ";Persist Security Info=True" +
                                ";Max Pool Size=1000;";
            dataconnection = new System.Data.SqlClient.SqlConnection(ConnectionString);

            dataconnection.Open();
            sqlexecute.Connection = dataconnection;

            return true;
        }

        public System.Data.DataSet GetDataSet(string strsql)
        {
            OpenDB();
            System.Data.DataSet TempDataSet = new System.Data.DataSet();
            sqlexecute.CommandText = strsql;
            sqladapter.SelectCommand = sqlexecute;

            sqladapter.Fill(TempDataSet);
            Close();
            return TempDataSet;

        }

        public void GetHierDataSet(string strsql, string dsname, ref System.Data.DataSet TempDataSet)
        {
            OpenDB();

            sqlexecute.CommandText = strsql;
            sqladapter.SelectCommand = sqlexecute;
            sqladapter.Fill(TempDataSet, dsname);
            Close();
            //return TempDataSet;


        }
        public System.Data.SqlClient.SqlDataReader GetReader(string strsql)
        {


            OpenDB();
            sqlexecute.CommandText = strsql;
            sqlexecute.Connection = dataconnection;
            sqlreader = sqlexecute.ExecuteReader();

            return sqlreader;
        }

        public int getInt(string strsql)
        {
            int count;
            OpenDB();
            sqlexecute.CommandText = strsql;
            count = (int)sqlexecute.ExecuteScalar();
            Close();
            return count;


        }

        public byte getTinyValue(string strsql)
        {
            byte bValue;
            OpenDB();
            sqlexecute.CommandText = strsql;
            bValue = (byte)sqlexecute.ExecuteScalar();
            Close();
            return bValue;
        }
        public string getStringValue(string strsql)
        {
            System.Data.SqlClient.SqlDataReader reader;
            string bValue = "";
            OpenDB();
            sqlexecute.CommandText = strsql;
            reader = sqlexecute.ExecuteReader();
            while (reader.Read())
            {
                if (reader.IsDBNull(0) == false)
                {
                    bValue = reader.GetString(0);
                }
            }
            reader.Close();
            Close();
            return bValue;
        }
        public decimal getSum(string strsql)
        {
            System.Data.SqlClient.SqlDataReader reader;

            decimal sum = 0;
            OpenDB();
            sqlexecute.CommandText = strsql;
            reader = GetReader(strsql);
            while (reader.Read())
            {
                if (reader.IsDBNull(0) == false)
                {
                    sum = reader.GetDecimal(0);
                }
            }
            reader.Close();
            Close();
            return sum;
        }

        public float getFloat(string strsql)
        {
            System.Data.SqlClient.SqlDataReader reader;

            float sum = 0f;
            OpenDB();
            sqlexecute.CommandText = strsql;
            reader = GetReader(strsql);
            while (reader.Read())
            {
                if (reader.IsDBNull(0) == false)
                {
                    sum = (float)reader.GetDouble(0);
                }
            }
            reader.Close();
            Close();
            return sum;
        }
        public void Close()
        {
            dataconnection.Close();
        }

    }
}

