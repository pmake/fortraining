﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;
using System.Web.Security;

namespace webapp
{
    public partial class login : ezPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //進入登入頁就執行 Session 變數初始化
                ezSession.SessionInit();
                lbl_app_name.Text = ezSession.AppName;
                Session["Counts"] = "0";
            }
        }

        protected void rpl_master_Init(object sender, EventArgs e)
        {
            ezASPxRoundPanel.Init(sender, e, false);
            //設定登入頁的系統名稱
            rpl_master.HeaderText = ezSession.AppName;
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            //檢查驗驗碼是否正確
            if (cpc_code.IsValid)
            {
                //檢查使用者帳密是否正確
                if (CheckUser())
                {
                    //導向首頁
                    ezUtility.RedirectToHomeUrl();
                }
                else
                {
                    int int_counts = 0;
                    int int_errors = 0;
                    bool bln_count = false;
                    if (ezSession.LogErrorCount != "0")
                    {
                        Session["Counts"] = (int.Parse(Session["Counts"].ToString()) + 1).ToString();
                        int_counts = int.Parse(ezSession.LogErrorCount.ToString());
                        int_errors = int.Parse(Session["Counts"].ToString());
                        if (int_errors > int_counts) bln_count = true;
                    }

                    if (bln_count)
                    {
                        int_counts = int.Parse(ezSession.LogErrorCount.ToString());
                        lbl_login_error_msg.Text = "很抱歉, 由於您輸入錯誤次數已超過 " + int_counts.ToString() + " 次 , 請再重新輸入 , 或連絡管理人員,謝謝 !!";
                        Session["Counts"] = "0";
                        puc_logerror.ShowOnPageLoad = true;
                    }
                    else
                        ShowMsgBox("帳號或密碼錯誤!!");
                }
            }
        }

        private bool CheckUser()
        {
            //傳回值變數
            bool bln_hasrow = false;
            //使用 ezSqlServer ADO.Net 函數類別
            ezSqlServer ezsql = new ezSqlServer();
            //設定 SQL 語法
            ezsql.CommandText = "SELECT name_user , code_user FROM z_org_user WHERE no_user = @no_user AND pass_user = @pass_user";
            //加入參數
            ezsql.ParametersAdd("@no_user", txt_user_no.Text, true);
            ezsql.ParametersAdd("@pass_user", txt_password.Text, false);
            //判斷是否有記錄
            bln_hasrow = ezsql.HasRows;
            //有記錄表示登入正確
            if (bln_hasrow)
            {
                //取得 Select 語法中的 code_user 欄位值
                string str_code_user = ezsql.GetValueString("code_user");
                //設定 Session UserNo 使用者代號
                ezSession.UserNo = txt_user_no.Text;
                //設定 Session UserName 使用者名稱
                ezSession.UserName = ezsql.GetValueString("name_user");
                //設定 Session UserCode 使用者類別 (使用者/管理者)
                ezSession.UserCode = (str_code_user == "A") ? ezEnum.UserCode.Admin : ezEnum.UserCode.User;
            }
            //關閉 ezSqlServer ADO.Net 函數類別
            ezsql.Close();
            //回傳是否登入正確
            return bln_hasrow;
        }

        protected void puc_logerror_Init(object sender, EventArgs e)
        {
            ezASPxPopupControl.Init(sender, e);
            puc_logerror.ShowCloseButton = true;
        }
    }
}