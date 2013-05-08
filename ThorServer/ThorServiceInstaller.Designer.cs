namespace ThorServer
{
    partial class ThorServiceInstaller
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

        #region Component Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.thorProcessInstaller = new System.ServiceProcess.ServiceProcessInstaller();
            this.thorInstaller = new System.ServiceProcess.ServiceInstaller();
            // 
            // thorProcessInstaller
            // 
            this.thorProcessInstaller.Password = null;
            this.thorProcessInstaller.Username = null;
            // 
            // thorInstaller
            // 
            this.thorInstaller.ServiceName = "Thor Server";
            // 
            // ProjectInstaller
            // 
            this.Installers.AddRange(new System.Configuration.Install.Installer[] {
            this.thorProcessInstaller,
            this.thorInstaller});

        }

        #endregion

        private System.ServiceProcess.ServiceProcessInstaller thorProcessInstaller;
        private System.ServiceProcess.ServiceInstaller thorInstaller;
    }
}