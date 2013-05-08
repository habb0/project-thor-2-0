using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ThorHelper
{
    public partial class frmSqlGenerator : Form
    {
        public frmSqlGenerator()
        {
            InitializeComponent();
        }

        private void frmSqlGenerator_Load(object sender, EventArgs e)
        {

        }

        private void btnConvert_Click(object sender, EventArgs e)
        {
            writeSql(txtInput.Text);
        }


        private void writeSql(string input)
        {
            input = input.Replace(Convert.ToChar(13).ToString(), "");
            input = input.Replace(Convert.ToChar(10).ToString(), "");

            StringBuilder sqlOut = new StringBuilder();
            string[] items = input.Split('|');

            sqlOut.Append("DECLARE @id int;\r\n");

            foreach (string item in items)
            {
                string[] itemParts = item.Split(' ');

                string sprite = itemParts[1];
                string x = itemParts[2];
                string y = itemParts[3];
                string z = itemParts[4];
                string r = itemParts[5];
  
                sqlOut.Append("IF (SELECT COUNT(*) FROM FurniDefinitions WHERE Sprite = '" + sprite + "') = 0\r\n");
                sqlOut.Append("BEGIN\r\n");

                sqlOut.Append("Print 'Adding " + sprite + "'\r\n");
                sqlOut.Append("INSERT INTO FurniDefinitions (Sprite, CanTrade, PublicFurni)");
                sqlOut.Append(" VALUES ('" + sprite + "', 0, 1);\r\n");
                sqlOut.Append("SET @id = @@identity\r\n");
                sqlOut.Append("END\r\n");
                sqlOut.Append("ELSE\r\n");
                sqlOut.Append("BEGIN\r\n");
                sqlOut.Append("SET @id = (SELECT FurniDefinitionID FROM FurniDefinitions WHERE Sprite = '" + sprite + "')\r\n");
                sqlOut.Append("END\r\n");
                sqlOut.Append("PRINT @id\r\n");
                sqlOut.Append("\r\n");

                sqlOut.Append("IF (SELECT COUNT(*) FROM Furni WHERE FurniTypeID = @id AND PosX = " + x + " AND PosY = " + y + ") = 0\r\n");
                sqlOut.Append("BEGIN\r\n");
                sqlOut.Append("INSERT INTO Furni (RoomID, FurniTypeID, PosX, PosY, PosZ, PosRotation) ");
                sqlOut.Append("VALUES (" + txtRoomId.Text + ", @id, " + x + ", " + y + ", " + z + ", " + r + ");\r\n");
                sqlOut.Append("END\r\n");
                sqlOut.Append("\r\n");
                sqlOut.Append("\r\n");

            }

            txtOutput.Text = sqlOut.ToString();
        }
    }
}
