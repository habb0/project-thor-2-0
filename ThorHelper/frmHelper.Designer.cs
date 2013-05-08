namespace ThorHelper
{
    partial class frmHelper
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.gbB64 = new System.Windows.Forms.GroupBox();
            this.btnDecode64 = new System.Windows.Forms.Button();
            this.btnB64Encode = new System.Windows.Forms.Button();
            this.txtB64Output = new System.Windows.Forms.TextBox();
            this.txtBase64Input = new System.Windows.Forms.TextBox();
            this.serviceController = new System.ServiceProcess.ServiceController();
            this.gbService = new System.Windows.Forms.GroupBox();
            this.btnStart = new System.Windows.Forms.Button();
            this.btnArgDecode = new System.Windows.Forms.Button();
            this.gbArgBox = new System.Windows.Forms.GroupBox();
            this.btnArgEncode = new System.Windows.Forms.Button();
            this.txtArgOutput = new System.Windows.Forms.TextBox();
            this.txtArgInput = new System.Windows.Forms.TextBox();
            this.btnImportTool = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnPlaintext = new System.Windows.Forms.Button();
            this.txtFilterResult = new System.Windows.Forms.TextBox();
            this.txtFilterInput = new System.Windows.Forms.TextBox();
            this.gbB64.SuspendLayout();
            this.gbService.SuspendLayout();
            this.gbArgBox.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // gbB64
            // 
            this.gbB64.Controls.Add(this.btnDecode64);
            this.gbB64.Controls.Add(this.btnB64Encode);
            this.gbB64.Controls.Add(this.txtB64Output);
            this.gbB64.Controls.Add(this.txtBase64Input);
            this.gbB64.Location = new System.Drawing.Point(12, 78);
            this.gbB64.Name = "gbB64";
            this.gbB64.Size = new System.Drawing.Size(317, 59);
            this.gbB64.TabIndex = 0;
            this.gbB64.TabStop = false;
            this.gbB64.Text = "Base64";
            // 
            // btnDecode64
            // 
            this.btnDecode64.Location = new System.Drawing.Point(253, 19);
            this.btnDecode64.Name = "btnDecode64";
            this.btnDecode64.Size = new System.Drawing.Size(58, 21);
            this.btnDecode64.TabIndex = 3;
            this.btnDecode64.Text = "Decode";
            this.btnDecode64.UseVisualStyleBackColor = true;
            this.btnDecode64.Click += new System.EventHandler(this.btnDecode64_Click);
            // 
            // btnB64Encode
            // 
            this.btnB64Encode.Location = new System.Drawing.Point(188, 20);
            this.btnB64Encode.Name = "btnB64Encode";
            this.btnB64Encode.Size = new System.Drawing.Size(58, 21);
            this.btnB64Encode.TabIndex = 2;
            this.btnB64Encode.Text = "Encode";
            this.btnB64Encode.UseVisualStyleBackColor = true;
            this.btnB64Encode.Click += new System.EventHandler(this.btnB64Encode_Click);
            // 
            // txtB64Output
            // 
            this.txtB64Output.Location = new System.Drawing.Point(107, 21);
            this.txtB64Output.Name = "txtB64Output";
            this.txtB64Output.ReadOnly = true;
            this.txtB64Output.Size = new System.Drawing.Size(67, 20);
            this.txtB64Output.TabIndex = 1;
            // 
            // txtBase64Input
            // 
            this.txtBase64Input.Location = new System.Drawing.Point(16, 22);
            this.txtBase64Input.Name = "txtBase64Input";
            this.txtBase64Input.Size = new System.Drawing.Size(66, 20);
            this.txtBase64Input.TabIndex = 0;
            // 
            // gbService
            // 
            this.gbService.Controls.Add(this.btnStart);
            this.gbService.Location = new System.Drawing.Point(12, 5);
            this.gbService.Name = "gbService";
            this.gbService.Size = new System.Drawing.Size(129, 60);
            this.gbService.TabIndex = 1;
            this.gbService.TabStop = false;
            this.gbService.Text = "Test Server";
            // 
            // btnStart
            // 
            this.btnStart.Location = new System.Drawing.Point(5, 19);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(115, 30);
            this.btnStart.TabIndex = 0;
            this.btnStart.Text = "Start";
            this.btnStart.UseVisualStyleBackColor = true;
            this.btnStart.Click += new System.EventHandler(this.btnStart_Click);
            // 
            // btnArgDecode
            // 
            this.btnArgDecode.Location = new System.Drawing.Point(253, 19);
            this.btnArgDecode.Name = "btnArgDecode";
            this.btnArgDecode.Size = new System.Drawing.Size(58, 21);
            this.btnArgDecode.TabIndex = 3;
            this.btnArgDecode.Text = "Decode";
            this.btnArgDecode.UseVisualStyleBackColor = true;
            this.btnArgDecode.Click += new System.EventHandler(this.btnArgDecode_Click);
            // 
            // gbArgBox
            // 
            this.gbArgBox.Controls.Add(this.btnArgDecode);
            this.gbArgBox.Controls.Add(this.btnArgEncode);
            this.gbArgBox.Controls.Add(this.txtArgOutput);
            this.gbArgBox.Controls.Add(this.txtArgInput);
            this.gbArgBox.Location = new System.Drawing.Point(12, 157);
            this.gbArgBox.Name = "gbArgBox";
            this.gbArgBox.Size = new System.Drawing.Size(317, 59);
            this.gbArgBox.TabIndex = 2;
            this.gbArgBox.TabStop = false;
            this.gbArgBox.Text = "Argument Wire";
            // 
            // btnArgEncode
            // 
            this.btnArgEncode.Location = new System.Drawing.Point(188, 20);
            this.btnArgEncode.Name = "btnArgEncode";
            this.btnArgEncode.Size = new System.Drawing.Size(58, 21);
            this.btnArgEncode.TabIndex = 2;
            this.btnArgEncode.Text = "Encode";
            this.btnArgEncode.UseVisualStyleBackColor = true;
            this.btnArgEncode.Click += new System.EventHandler(this.btnArgEncode_Click);
            // 
            // txtArgOutput
            // 
            this.txtArgOutput.Location = new System.Drawing.Point(107, 21);
            this.txtArgOutput.Name = "txtArgOutput";
            this.txtArgOutput.ReadOnly = true;
            this.txtArgOutput.Size = new System.Drawing.Size(67, 20);
            this.txtArgOutput.TabIndex = 1;
            // 
            // txtArgInput
            // 
            this.txtArgInput.Location = new System.Drawing.Point(16, 22);
            this.txtArgInput.Name = "txtArgInput";
            this.txtArgInput.Size = new System.Drawing.Size(66, 20);
            this.txtArgInput.TabIndex = 0;
            // 
            // btnImportTool
            // 
            this.btnImportTool.Location = new System.Drawing.Point(220, 472);
            this.btnImportTool.Name = "btnImportTool";
            this.btnImportTool.Size = new System.Drawing.Size(109, 27);
            this.btnImportTool.TabIndex = 3;
            this.btnImportTool.Text = "Room Import Tool";
            this.btnImportTool.UseVisualStyleBackColor = true;
            this.btnImportTool.Click += new System.EventHandler(this.btnImportTool_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnPlaintext);
            this.groupBox1.Controls.Add(this.txtFilterResult);
            this.groupBox1.Controls.Add(this.txtFilterInput);
            this.groupBox1.Location = new System.Drawing.Point(12, 238);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(317, 213);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Filters";
            // 
            // btnPlaintext
            // 
            this.btnPlaintext.Location = new System.Drawing.Point(6, 186);
            this.btnPlaintext.Name = "btnPlaintext";
            this.btnPlaintext.Size = new System.Drawing.Size(58, 21);
            this.btnPlaintext.TabIndex = 2;
            this.btnPlaintext.Text = "Plaintext";
            this.btnPlaintext.UseVisualStyleBackColor = true;
            this.btnPlaintext.Click += new System.EventHandler(this.btnPlaintext_Click);
            // 
            // txtFilterResult
            // 
            this.txtFilterResult.Location = new System.Drawing.Point(15, 113);
            this.txtFilterResult.Multiline = true;
            this.txtFilterResult.Name = "txtFilterResult";
            this.txtFilterResult.ReadOnly = true;
            this.txtFilterResult.Size = new System.Drawing.Size(284, 67);
            this.txtFilterResult.TabIndex = 1;
            // 
            // txtFilterInput
            // 
            this.txtFilterInput.Location = new System.Drawing.Point(16, 22);
            this.txtFilterInput.Multiline = true;
            this.txtFilterInput.Name = "txtFilterInput";
            this.txtFilterInput.Size = new System.Drawing.Size(283, 74);
            this.txtFilterInput.TabIndex = 0;
            // 
            // frmHelper
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(340, 511);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnImportTool);
            this.Controls.Add(this.gbArgBox);
            this.Controls.Add(this.gbService);
            this.Controls.Add(this.gbB64);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.MaximizeBox = false;
            this.Name = "frmHelper";
            this.Text = "Thor Help Kit";
            this.gbB64.ResumeLayout(false);
            this.gbB64.PerformLayout();
            this.gbService.ResumeLayout(false);
            this.gbArgBox.ResumeLayout(false);
            this.gbArgBox.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox gbB64;
        private System.Windows.Forms.Button btnDecode64;
        private System.Windows.Forms.Button btnB64Encode;
        private System.Windows.Forms.TextBox txtB64Output;
        private System.Windows.Forms.TextBox txtBase64Input;
        private System.ServiceProcess.ServiceController serviceController;
        private System.Windows.Forms.GroupBox gbService;
        private System.Windows.Forms.Button btnStart;
        private System.Windows.Forms.Button btnArgDecode;
        private System.Windows.Forms.GroupBox gbArgBox;
        private System.Windows.Forms.Button btnArgEncode;
        private System.Windows.Forms.TextBox txtArgOutput;
        private System.Windows.Forms.TextBox txtArgInput;
        private System.Windows.Forms.Button btnImportTool;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnPlaintext;
        private System.Windows.Forms.TextBox txtFilterResult;
        private System.Windows.Forms.TextBox txtFilterInput;
    }
}

