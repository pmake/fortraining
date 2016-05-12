﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sysp001_program.aspx.cs" Inherits="webapp.Forms.sys.sysp001_program" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxRoundPanel ID="rpl_master" runat="server" OnInit="rpl_master_Init" Theme="BlackGlass" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_sys_module" EnableTheming="True" KeyFieldName="rowid" OnInit="gv_master_Init" Theme="BlackGlass" Width="100%" OnInitNewRow="gv_master_InitNewRow">
                            <SettingsDetail ShowDetailRow="True" />
                            <Templates>
                                <DetailRow>
                                    <dx:ASPxGridView ID="gv_detail" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_sys_prg" EnableTheming="True" KeyFieldName="rowid" Theme="BlackGlass" OnBeforePerformDataSelect="gv_detail_BeforePerformDataSelect" OnInit="gv_detail_Init" OnInitNewRow="gv_detail_InitNewRow" Width="100%">
                                        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn Caption="排序" FieldName="sort_prg" VisibleIndex="1">
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="代號" FieldName="no_prg" VisibleIndex="2">
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_prg" VisibleIndex="3">
                                                <EditFormSettings ColumnSpan="2" />
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataCheckColumn Caption="啟用" FieldName="isenabled" VisibleIndex="4">
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataCheckColumn Caption="顯示" FieldName="isvisible" VisibleIndex="5">
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataCheckColumn Caption="公用" FieldName="ispublic" VisibleIndex="6">
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataCheckColumn Caption="編號" FieldName="isautono" VisibleIndex="7">
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataCheckColumn>
                                            <dx:GridViewDataTextColumn Caption="程式位置" FieldName="url_prg" VisibleIndex="8">
                                                <EditFormSettings ColumnSpan="2" />
                                                <HeaderStyle Wrap="False" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" VisibleIndex="14" Width="100%">
                                                <EditFormSettings ColumnSpan="2" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="rowid" VisibleIndex="15" ReadOnly="True" Visible="False">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="module_no" VisibleIndex="16" Visible="False">
                                                <HeaderStyle Wrap="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="表單自動編號設定" VisibleIndex="9">
                                                <Columns>
                                                    <dx:GridViewDataComboBoxColumn Caption="編號方式" FieldName="code_autono" ShowInCustomizationForm="True" VisibleIndex="10">
                                                        <PropertiesComboBox>
                                                            <Items>
                                                                <dx:ListEditItem Selected="True" Text="年" Value="Y" />
                                                                <dx:ListEditItem Text="年月" Value="YM" />
                                                                <dx:ListEditItem Text="年月日" Value="YMD" />
                                                            </Items>
                                                        </PropertiesComboBox>
                                                        <HeaderStyle Wrap="False" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataComboBoxColumn>
                                                    <dx:GridViewDataTextColumn Caption="前置符號" FieldName="no_autono_lead" ShowInCustomizationForm="True" VisibleIndex="11">
                                                        <HeaderStyle Wrap="False" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="日期欄位" FieldName="col_autono_date" ShowInCustomizationForm="True" VisibleIndex="12">
                                                        <HeaderStyle Wrap="False" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="編號欄位" FieldName="col_autono_no" ShowInCustomizationForm="True" VisibleIndex="13">
                                                        <HeaderStyle Wrap="False" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                        </Columns>
                                    </dx:ASPxGridView>
                                </DetailRow>
                            </Templates>
                            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataCheckColumn Caption="啟用" FieldName="isenabled" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataCheckColumn>
                                <dx:GridViewDataComboBoxColumn Caption="類別" FieldName="code_module" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <PropertiesComboBox>
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="前台程式" Value="F" />
                                            <dx:ListEditItem Text="後台程式" Value="B" />
                                        </Items>
                                    </PropertiesComboBox>
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataTextColumn Caption="排序" FieldName="sort_module" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="代號" FieldName="no_module" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="名稱" FieldName="name_module" ShowInCustomizationForm="True" VisibleIndex="5">
                                    <HeaderStyle Wrap="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" ShowInCustomizationForm="True" VisibleIndex="6" Width="100%">
                                    <HeaderStyle Wrap="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
        <div>
            <asp:SqlDataSource ID="sds_z_sys_module" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_sys_module] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [z_sys_module] ([isenabled], [code_module], [sort_module], [no_module], [name_module], [remark]) VALUES (@isenabled, @code_module, @sort_module, @no_module, @name_module, @remark)" SelectCommand="SELECT isenabled, code_module, sort_module, no_module, name_module, remark, rowid FROM z_sys_module ORDER BY code_module DESC, sort_module, no_module" UpdateCommand="UPDATE [z_sys_module] SET [isenabled] = @isenabled, [code_module] = @code_module, [sort_module] = @sort_module, [no_module] = @no_module, [name_module] = @name_module, [remark] = @remark WHERE [rowid] = @rowid" OnInit="sds_z_sys_module_Init">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="isenabled" Type="Int32" />
                    <asp:Parameter Name="code_module" Type="String" />
                    <asp:Parameter Name="sort_module" Type="String" />
                    <asp:Parameter Name="no_module" Type="String" />
                    <asp:Parameter Name="name_module" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="isenabled" Type="Int32" />
                    <asp:Parameter Name="code_module" Type="String" />
                    <asp:Parameter Name="sort_module" Type="String" />
                    <asp:Parameter Name="no_module" Type="String" />
                    <asp:Parameter Name="name_module" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_z_sys_prg" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_sys_prg] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [z_sys_prg] ([module_no], [isenabled], [isvisible], [ispublic], [isautono], [sort_prg], [no_prg], [name_prg], [url_prg], [code_autono], [no_autono_lead], [col_autono_date], [col_autono_no], [remark]) VALUES (@module_no, @isenabled, @isvisible, @ispublic, @isautono, @sort_prg, @no_prg, @name_prg, @url_prg, @code_autono, @no_autono_lead, @col_autono_date, @col_autono_no, @remark)" SelectCommand="SELECT sort_prg, no_prg, name_prg, isenabled, isvisible, ispublic, isautono, url_prg, code_autono, no_autono_lead, col_autono_date, col_autono_no, remark, rowid, module_no FROM z_sys_prg WHERE (module_no = @module_no) ORDER BY sort_prg, no_prg" UpdateCommand="UPDATE z_sys_prg SET isenabled = @isenabled, isvisible = @isvisible, ispublic = @ispublic, isautono = @isautono, sort_prg = @sort_prg, no_prg = @no_prg, name_prg = @name_prg, url_prg = @url_prg, code_autono = @code_autono, no_autono_lead = @no_autono_lead, col_autono_date = @col_autono_date, col_autono_no = @col_autono_no, remark = @remark WHERE (rowid = @rowid)" OnInit="sds_z_sys_prg_Init">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="module_no" SessionField="parm1" Type="String" />
                    <asp:Parameter Name="isenabled" Type="Int32" />
                    <asp:Parameter Name="isvisible" Type="Int32" />
                    <asp:Parameter Name="ispublic" Type="Int32" />
                    <asp:Parameter Name="isautono" Type="Int32" />
                    <asp:Parameter Name="sort_prg" Type="String" />
                    <asp:Parameter Name="no_prg" Type="String" />
                    <asp:Parameter Name="name_prg" Type="String" />
                    <asp:Parameter Name="url_prg" Type="String" />
                    <asp:Parameter Name="code_autono" Type="String" />
                    <asp:Parameter Name="no_autono_lead" Type="String" />
                    <asp:Parameter Name="col_autono_date" Type="String" />
                    <asp:Parameter Name="col_autono_no" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="module_no" SessionField="parm1" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="isenabled" Type="Int32" />
                    <asp:Parameter Name="isvisible" Type="Int32" />
                    <asp:Parameter Name="ispublic" Type="Int32" />
                    <asp:Parameter Name="isautono" Type="Int32" />
                    <asp:Parameter Name="sort_prg" Type="String" />
                    <asp:Parameter Name="no_prg" Type="String" />
                    <asp:Parameter Name="name_prg" Type="String" />
                    <asp:Parameter Name="url_prg" Type="String" />
                    <asp:Parameter Name="code_autono" Type="String" />
                    <asp:Parameter Name="no_autono_lead" Type="String" />
                    <asp:Parameter Name="col_autono_date" Type="String" />
                    <asp:Parameter Name="col_autono_no" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
