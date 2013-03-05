﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MetraTech.ExpressionEngine;

namespace PropertyGui
{
    public partial class frmGlobalExplorer : Form
    {
        #region Constructor
        public frmGlobalExplorer(string caption)
        {
            InitializeComponent();
            this.Text = string.Format("Explorer ({0})", caption);
            WindowState = FormWindowState.Maximized;
            ctlExpressionExplorer.Init(DemoLoader.GlobalContext);
        }
        #endregion
    }
}
