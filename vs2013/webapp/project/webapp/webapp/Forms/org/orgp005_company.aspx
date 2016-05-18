﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orgp005_company.aspx.cs" Inherits="webapp.Forms.org.orgp005_company" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxRoundPanel ID="rpl_master" runat="server" ShowCollapseButton="true" Theme="BlackGlass" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="sds_z_org_company" EnableTheming="True" KeyFieldName="rowid" Theme="BlackGlass" Width="100%">
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="公司代號" FieldName="no_comp" ShowInCustomizationForm="True" VisibleIndex="1">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="公司名稱" FieldName="name_comp" ShowInCustomizationForm="True" VisibleIndex="2">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="統一編號" FieldName="id_comp" ShowInCustomizationForm="True" VisibleIndex="4">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="負責人" FieldName="name_boss" ShowInCustomizationForm="True" VisibleIndex="5">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="公司電話" FieldName="tel_comp" ShowInCustomizationForm="True" VisibleIndex="6">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="傳真電話" FieldName="fax_comp" ShowInCustomizationForm="True" VisibleIndex="7">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="電子信箱" FieldName="email_comp" ShowInCustomizationForm="True" VisibleIndex="8">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="公司地址" FieldName="addr_comp" ShowInCustomizationForm="True" VisibleIndex="9">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" ShowInCustomizationForm="True" VisibleIndex="10" Width="100%">
                <HeaderStyle Wrap="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="啟用" FieldName="isenabled" ShowInCustomizationForm="True" VisibleIndex="3">
                <HeaderStyle Wrap="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataCheckColumn>
        </Columns>
    </dx:ASPxGridView>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
        <div>
        </div>
        <div>
            <asp:SqlDataSource ID="sds_z_org_company" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_org_company] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO [z_org_company] ([isenabled], [no_comp], [name_comp], [id_comp], [name_boss], [tel_comp], [fax_comp], [email_comp], [addr_comp], [remark]) VALUES (@isenabled, @no_comp, @name_comp, @id_comp, @name_boss, @tel_comp, @fax_comp, @email_comp, @addr_comp, @remark)" SelectCommand="SELECT no_comp, name_comp, isenabled, id_comp, name_boss, tel_comp, fax_comp, email_comp, addr_comp, remark, rowid FROM z_org_company ORDER BY no_comp" UpdateCommand="UPDATE [z_org_company] SET [isenabled] = @isenabled, [no_comp] = @no_comp, [name_comp] = @name_comp, [id_comp] = @id_comp, [name_boss] = @name_boss, [tel_comp] = @tel_comp, [fax_comp] = @fax_comp, [email_comp] = @email_comp, [addr_comp] = @addr_comp, [remark] = @remark WHERE [rowid] = @rowid">
                <DeleteParameters>
                    <asp:Parameter Name="rowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="isenabled" Type="Int32" />
                    <asp:Parameter Name="no_comp" Type="String" />
                    <asp:Parameter Name="name_comp" Type="String" />
                    <asp:Parameter Name="id_comp" Type="String" />
                    <asp:Parameter Name="name_boss" Type="String" />
                    <asp:Parameter Name="tel_comp" Type="String" />
                    <asp:Parameter Name="fax_comp" Type="String" />
                    <asp:Parameter Name="email_comp" Type="String" />
                    <asp:Parameter Name="addr_comp" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="isenabled" Type="Int32" />
                    <asp:Parameter Name="no_comp" Type="String" />
                    <asp:Parameter Name="name_comp" Type="String" />
                    <asp:Parameter Name="id_comp" Type="String" />
                    <asp:Parameter Name="name_boss" Type="String" />
                    <asp:Parameter Name="tel_comp" Type="String" />
                    <asp:Parameter Name="fax_comp" Type="String" />
                    <asp:Parameter Name="email_comp" Type="String" />
                    <asp:Parameter Name="addr_comp" Type="String" />
                    <asp:Parameter Name="remark" Type="String" />
                    <asp:Parameter Name="rowid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>