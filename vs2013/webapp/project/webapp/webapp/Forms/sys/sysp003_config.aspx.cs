﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Configuration;
using ezapp;

namespace webapp.Forms.sys
{
    public partial class sysp003_config : ezPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) ReadData();
        }

        private void ReadData()
        {
            string str_app_name = WebConfigurationManager.AppSettings["AppName"].ToString();
            string str_debug_mode = WebConfigurationManager.AppSettings["DebugMode"].ToString();
            string str_login_url = WebConfigurationManager.AppSettings["LoginUrl"].ToString();
            string str_home_url = WebConfigurationManager.AppSettings["HomeUrl"].ToString();
            string str_conn_name = WebConfigurationManager.AppSettings["ConnName"].ToString();
            string str_language = WebConfigurationManager.AppSettings["Language"].ToString();

            txt_app_name.Text = str_app_name;
            cbx_debug_mode.Checked = (str_debug_mode == "1") ? true : false;
            txt_login_url.Text = str_login_url;
            txt_home_url.Text = str_home_url;
            txt_conn_name.Text = str_conn_name;
            cbb_language.Value = str_language;
            if (str_language == "zh-TW") cbb_language.Text = "繁體中文";
            if (str_language == "zh-CN") cbb_language.Text = "简体中文";
            if (str_language == "en-US") cbb_language.Text = "English";
        }

        protected void rpl_master_Init(object sender, EventArgs e)
        {
            ezASPxRoundPanel.Init(sender, e, true);
        }

        protected void btn_app_update_Click(object sender, EventArgs e)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration("/");

            string str_app_name = txt_app_name.Text;
            string str_debug_mode = (cbx_debug_mode.Checked) ? "1" : "0";
            string str_login_url = txt_login_url.Text;
            string str_home_url = txt_home_url.Text;
            string str_conn_name = txt_conn_name.Text;
            string str_language = cbb_language.Value.ToString();

            config.AppSettings.Settings["AppName"].Value = str_app_name;
            config.AppSettings.Settings["DebugMode"].Value = str_debug_mode;
            config.AppSettings.Settings["LoginUrl"].Value = str_login_url;
            config.AppSettings.Settings["HomeUrl"].Value = str_home_url;
            config.AppSettings.Settings["ConnName"].Value = str_conn_name;
            config.AppSettings.Settings["Language"].Value = str_language;

            //config.Save(ConfigurationSaveMode.Modified);
            config.Save();
        }

        protected void btn_background_Click(object sender, EventArgs e)
        {
            Session["parm1"] = "background.png";
            puc_upload.ShowOnPageLoad = true;
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            Session["parm1"] = "logo_login.png";
            puc_upload.ShowOnPageLoad = true;
        }

        protected void btn_logo_Click(object sender, EventArgs e)
        {
            Session["parm1"] = "logo_home.png";
            puc_upload.ShowOnPageLoad = true;
        }

        protected void puc_upload_Init(object sender, EventArgs e)
        {
            ezASPxPopupControl.Init(sender, e);
        }

        protected void btn_upload_close_Click(object sender, EventArgs e)
        {
            img_background.ImageUrl = "~/Images/Apps/background.png";
            img_login.ImageUrl = "~/Images/Apps/logo_login.png";
            img_logo.ImageUrl = "~/Images/Apps/logo_home.png";
            puc_upload.ShowOnPageLoad = false;
        }

        protected void ulc_upload_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                string str_filename = Session["parm1"].ToString();
                e.UploadedFile.SaveAs(MapPath("~/Images/Apps/" + str_filename));
                //e.UploadedFile.SaveAs(MapPath("~/Images/" + e.UploadedFile.FileName));
            }
        }
    }
}