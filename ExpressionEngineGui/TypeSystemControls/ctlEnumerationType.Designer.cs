﻿namespace PropertyGui.TypeSystemControls
{
    partial class ctlEnumerationType
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
            this.label1 = new System.Windows.Forms.Label();
            this.cboEnumeration = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(0, 3);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(52, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Category:";
            // 
            // cboEnumeration
            // 
            this.cboEnumeration.FormattingEnabled = true;
            this.cboEnumeration.Location = new System.Drawing.Point(55, 0);
            this.cboEnumeration.Name = "cboEnumeration";
            this.cboEnumeration.Size = new System.Drawing.Size(345, 21);
            this.cboEnumeration.TabIndex = 1;
            this.cboEnumeration.DropDown += new System.EventHandler(this.cboEnumeration_DropDown);
            // 
            // ctlEnumerationType
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.cboEnumeration);
            this.Controls.Add(this.label1);
            this.Name = "ctlEnumerationType";
            this.Size = new System.Drawing.Size(403, 22);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cboEnumeration;
    }
}
