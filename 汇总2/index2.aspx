<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index2.aspx.cs" Inherits="_180808.index2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheets/index.css" type="text/css" rel="Stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="c">
        <asp:ListView ID="ListView1" runat="server" GroupPlaceholderID="myGroup" ItemPlaceholderID="myItem" DataSourceID="SqlDataSource1" GroupItemCount="3">

                <%--定义主配置--%>
            <LayoutTemplate>
                <div id="ProductBox" class="mainBox" runat="server">
                    <div id="myGroup" runat="server">

                    </div>
                </div>
            </LayoutTemplate>
            <%--定义组配置--%>
            <GroupTemplate>
                <div id="group1" class="groupBox" runat="server">
                    <div id="myItem" runat="server">

                    </div>
                </div>
            </GroupTemplate>
            <%--定义项目配置--%>
            <ItemTemplate>
                <div id="itemBox" class="productItem" runat="server">

                    <div class="img">
                    <asp:Image ID="Image1" Height="230px" Width="230px" runat="server" ImageUrl='<%# Eval("ImgUrl1") %>' /><br />
                    </div>

                    <div class="description">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label><br />
                    </div>

                    <div class="unitprice">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("UnitPrice", "{0:C}") %>'></asp:Label><br />
                    </div>

                </div>
            </ItemTemplate>
            <%--定义组间隔模板--%>

            </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE ([Description] LIKE '%' + @Description + '%')">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Description" QueryStringField="keyword" Type="String" />
                </SelectParameters>
        </asp:SqlDataSource>

            <div class="ListViewPager">
                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="6">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>


    </div>
</asp:Content>
