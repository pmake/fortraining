﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;

namespace webapp.Forms.sys
{
    public partial class sysp001_program : ezPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rpl_master_Init(object sender, EventArgs e)
        {
            ezASPxRoundPanel.Init(sender, e, true);
        }


        protected void sds_z_sys_module_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void gv_master_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
        }

        protected void gv_master_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            ezASPxGridView.InitNewRow(sender , e , "code_module", "F");
        }

        protected void gv_detail_BeforePerformDataSelect(object sender, EventArgs e)
        {
            ezASPxGridView.BeforePerformDataSelect(sender, e, "parm1", "no_module");
        }

        protected void gv_detail_Init(object sender, EventArgs e)
        {
            ezASPxGridView.Init(sender, e, false);
        }

        protected void gv_detail_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            ezASPxGridView.InitNewRow(sender, e, "isenabled", 1);
            ezASPxGridView.InitNewRow(sender, e, "isvisible", 1);
            ezASPxGridView.InitNewRow(sender, e, "ispublic", 0);
            ezASPxGridView.InitNewRow(sender, e, "isautono", 0);
            ezASPxGridView.InitNewRow(sender, e, "code_autono", "YMD");
        }

        protected void sds_z_sys_prg_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }
    }
}