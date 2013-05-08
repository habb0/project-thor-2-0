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
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

using ThorServer.Utilities;

namespace ThorHelper
{
    public partial class frmHelper : Form
    {
        public frmHelper()
        {
            InitializeComponent();
        }

        private void btnB64Encode_Click(object sender, EventArgs e)
        {
            try
            {
                txtB64Output.Text = Base64Encoding.EncodeInt(int.Parse(txtBase64Input.Text), 2);
            }
            catch
            {
                MessageBox.Show("Invalid input.");
            }
        }

        private void btnDecode64_Click(object sender, EventArgs e)
        {
            try
            {
                txtB64Output.Text = Base64Encoding.DecodeInt(txtBase64Input.Text).ToString();
            }
            catch
            {
                MessageBox.Show("Invalid input.");
            }
        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            try
            {
                ThorServer.InstanceManager.StartServer();
                MessageBox.Show("Started.");
            }
            catch
            {
                MessageBox.Show("Could not start server.");
            }
        }

        private void btnStop_Click(object sender, EventArgs e)
        {
            try
            {
                serviceController.ServiceName = "Thor Server";
                serviceController.Stop();
            }
            catch
            {
                MessageBox.Show("Could not stop service.");
            }
        }

        private void btnArgEncode_Click(object sender, EventArgs e)
        {
            try
            {
                txtArgOutput.Text = ArgumentEncoding.encodeInt(int.Parse(txtArgInput.Text)).ToString();
            }
            catch
            {
                MessageBox.Show("Invalid input.");
            }
        }

        private void btnArgDecode_Click(object sender, EventArgs e)
        {
            try
            {
                txtArgOutput.Text = ArgumentEncoding.decodeInt(txtArgInput.Text).ToString();
            }
            catch
            {
                MessageBox.Show("Invalid input.");
            }
        }

        private void btnImportTool_Click(object sender, EventArgs e)
        {
            frmSqlGenerator gen = new frmSqlGenerator();
            gen.ShowDialog();
        }

        private void btnPlaintext_Click(object sender, EventArgs e)
        {
            txtFilterResult.Text =  ThorServer.Utilities.SpecialFiltering.FilterName(txtFilterInput.Text);
        }
    }
}
