<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="_180808.index" %>

<script runat="server">

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton btnView = (LinkButton)sender;
        string pid = btnView.CommandArgument.ToString();
        Session.Add("PID",pid);
        Response.Redirect("YHProductDetails.aspx?pid=" + pid);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton btnAdd = (LinkButton)sender;
            string pid = btnAdd.CommandArgument.ToString();
            Response.Redirect("ShoppingCart.aspx?pid=" + pid);
        }
</script>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleSheets/index.css" type="text/css" rel="Stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="c">
    <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick" Orientation="Horizontal" DynamicVerticalOffset="10" Height="30px" Width="1200px" StaticSubMenuIndent="16px">
        <DynamicMenuItemStyle ForeColor="Black" />
        <DynamicSelectedStyle Height="30px" Width="60px" />
        <Items>
            <asp:MenuItem Text="首页" Value="1"></asp:MenuItem>
            <asp:MenuItem Text="居家生活" Value="2"></asp:MenuItem>
            <asp:MenuItem Text="服饰鞋包" Value="3"></asp:MenuItem>
            <asp:MenuItem Text="美食酒水" Value="4"></asp:MenuItem>
            <asp:MenuItem Text="个护清洁" Value="5"></asp:MenuItem>
            <asp:MenuItem Text="母婴亲子" Value="6"></asp:MenuItem>
            <asp:MenuItem Text="运动旅行" Value="7"></asp:MenuItem>
            <asp:MenuItem Text="数码家电" Value="8"></asp:MenuItem>
        </Items>
        <LevelMenuItemStyles>
            <asp:MenuItemStyle Font-Underline="False" ForeColor="Black" />
        </LevelMenuItemStyles>
        <LevelSelectedStyles>
            <asp:MenuItemStyle BorderColor="#CC0000" Font-Underline="False" />
        </LevelSelectedStyles>
        <StaticHoverStyle BorderColor="#CC9756" Font-Bold="True" Font-Italic="False" Font-Size="Large" ForeColor="#CC9756" />
        <StaticMenuItemStyle Font-Size="Large" Height="30px" Width="140px" ForeColor="Black" />
        <StaticSelectedStyle Font-Bold="True" Font-Size="Large" ForeColor="#CC9756" />
    </asp:Menu>

    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" >
        <asp:View ID="View1" runat="server">
            <div class="ad" id="box">
    <div class="screen"><!--相框-->
      <ul>
        <li><img src="img/ad1.png" /></li>
        <li><img src="img/ad2.png" /></li>
        <li><img src="img/ad3.png" /></li>
      </ul>
      <ol>
      </ol>
    </div>
    <div id="arr"><span id="left">&lt;</span><span id="right">&gt;</span></div>
  </div>
  <script src="ad.js"></script>          
            
            <div class="font-big">
              
                网站简介：这是一个简单的购物网站，所覆盖的范围较广，涉及居家、服饰、亲子等各个方面，相信你会喜欢它，快去购物吧~
            </div>

           
        </asp:View>

        <asp:View ID="View2" runat="server">
            <asp:ListView ID="ListView5" runat="server" GroupPlaceholderID="myGroup" ItemPlaceholderID="myItem" DataSourceID="SqlDataSource5" GroupItemCount="3">

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
                    <asp:Image ID="Image1" Height="230px" Width="230px" runat="server" ImageUrl='<%# Eval("ImgUrl2") %>' /><br />
                    </div>

                    <div class="description">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label><br />
                    </div>

                    <div class="unitprice">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("UnitPrice", "{0:C}") %>'></asp:Label><br />
                    </div>
                    <div class="detail">
                        <asp:LinkButton ID="LinkButton13" runat="server" Text="查看详情" 
                            OnClick="LinkButton1_Click" 
                            CommandArgument='<%# Eval("ProductID") %>'  ></asp:LinkButton>
                    </div>
                    <div class="cart">
                        <asp:LinkButton ID="LinkButton14" runat="server" Text="加入购物车" 
                            OnClick="LinkButton2_Click" 
                            CommandArgument='<%# Eval("ProductID") %>' ></asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
            <%--定义组间隔模板--%>

            </asp:ListView>

            
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE [ProductClass] ='居家生活'"></asp:SqlDataSource>

            
            <div class="ListViewPager">
                <asp:DataPager ID="DataPager5" runat="server" PagedControlID="ListView5" PageSize="6">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
   <asp:ListView ID="ListView6" runat="server" GroupPlaceholderID="myGroup" ItemPlaceholderID="myItem" DataSourceID="SqlDataSource8" GroupItemCount="3">

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
                    <div class="detail">
                        <asp:LinkButton ID="LinkButton11" runat="server" Text="查看详情" 
                            OnClick="LinkButton1_Click" 
                            CommandArgument='<%# Eval("ProductID") %>'  ></asp:LinkButton>
                    </div>
                    <div class="cart">
                        <asp:LinkButton ID="LinkButton12" runat="server" Text="加入购物车" 
                            OnClick="LinkButton2_Click" 
                            CommandArgument='<%# Eval("ProductID") %>' ></asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
            <%--定义组间隔模板--%>

            </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE [ProductClass] ='服饰鞋包'"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE [ProductClass] ='居家生活'"></asp:SqlDataSource>

            <div class="ListViewPager">
                <asp:DataPager ID="DataPager6" runat="server" PagedControlID="ListView1" PageSize="6">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </asp:View>


        <asp:View ID="View4" runat="server">
   <asp:ListView ID="ListView7" runat="server" GroupPlaceholderID="myGroup" ItemPlaceholderID="myItem" DataSourceID="SqlDataSource9" GroupItemCount="3">

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
                    <div class="detail">
                        <asp:LinkButton ID="LinkButton9" runat="server" Text="查看详情" 
                            OnClick="LinkButton1_Click" 
                            CommandArgument='<%# Eval("ProductID") %>'  ></asp:LinkButton>
                    </div>
                    <div class="cart">
                        <asp:LinkButton ID="LinkButton10" runat="server" Text="加入购物车" 
                            OnClick="LinkButton2_Click" 
                            CommandArgument='<%# Eval("ProductID") %>' ></asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
            <%--定义组间隔模板--%>

            </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE [ProductClass] ='美食酒水'"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE [ProductClass] ='居家生活'"></asp:SqlDataSource>

            <div class="ListViewPager">
                <asp:DataPager ID="DataPager7" runat="server" PagedControlID="ListView1" PageSize="6">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </asp:View>

        <asp:View ID="View5" runat="server">
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
                    <div class="detail">
                        <asp:LinkButton ID="LinkButton1" runat="server" Text="查看详情" 
                            OnClick="LinkButton1_Click" 
                            CommandArgument='<%# Eval("ProductID") %>'  ></asp:LinkButton>
                    </div>
                    <div class="cart">
                        <asp:LinkButton ID="LinkButton2" runat="server" Text="加入购物车" 
                            OnClick="LinkButton2_Click" 
                            CommandArgument='<%# Eval("ProductID") %>' ></asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
            <%--定义组间隔模板--%>

            </asp:ListView>

            <div class="ListViewPager">
                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="6">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE [ProductClass] ='个护清洁'">
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View6" runat="server">

            <asp:ListView ID="ListView2" runat="server" GroupPlaceholderID="myGroup" ItemPlaceholderID="myItem" DataSourceID="SqlDataSource2" GroupItemCount="3" >

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

                    <div class="detail">
                        <asp:LinkButton ID="LinkButton3" runat="server" Text="查看详情"  CommandArgument='<%# Eval("ProductID") %>' OnClick="LinkButton1_Click" ></asp:LinkButton>
                    </div>
                    <div class="cart">
                        <asp:LinkButton ID="LinkButton4" runat="server" Text="加入购物车" OnClick="LinkButton2_Click" CommandArgument='<%# Eval("ProductID") %>'></asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
            <%--定义组间隔模板--%>

            </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE [ProductClass] ='母婴亲子'"></asp:SqlDataSource>

            <div class="ListViewPager">
                <asp:DataPager ID="DataPager2" runat="server" PagedControlID="ListView2" PageSize="6">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>

        </asp:View>
        <asp:View ID="View7" runat="server">

            <asp:ListView ID="ListView3" runat="server" GroupPlaceholderID="myGroup" ItemPlaceholderID="myItem" DataSourceID="SqlDataSource3" GroupItemCount="3" >

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
                    <div class="detail">
                        <asp:LinkButton ID="LinkButton5" runat="server" Text="查看详情"  CommandArgument='<%# Eval("ProductID") %>' OnClick="LinkButton1_Click" ></asp:LinkButton>
                    </div>
                    <div class="cart">
                        <asp:LinkButton ID="LinkButton6" runat="server" Text="加入购物车" OnClick="LinkButton2_Click" CommandArgument='<%# Eval("ProductID") %>'></asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
            <%--定义组间隔模板--%>

            </asp:ListView>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE [ProductClass] ='运动旅行'"></asp:SqlDataSource>

            <div class="ListViewPager">
                <asp:DataPager ID="DataPager3" runat="server" PagedControlID="ListView3" PageSize="6">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>

        </asp:View>
        <asp:View ID="View8" runat="server">

            <asp:ListView ID="ListView4" runat="server" GroupPlaceholderID="myGroup" ItemPlaceholderID="myItem" DataSourceID="SqlDataSource4" GroupItemCount="3" >

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

                    <div class="detail">
                        <asp:LinkButton ID="LinkButton7" runat="server" Text="查看详情"  CommandArgument='<%# Eval("ProductID") %>' OnClick="LinkButton1_Click" ></asp:LinkButton>
                    </div>
                    <div class="cart">
                        <asp:LinkButton ID="LinkButton8" runat="server" Text="加入购物车" OnClick="LinkButton2_Click" CommandArgument='<%# Eval("ProductID") %>'></asp:LinkButton>
                    </div>



                </div>
            </ItemTemplate>
            <%--定义组间隔模板--%>

            </asp:ListView>


            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DB180808ConnectionString %>" SelectCommand="SELECT * FROM [PRODUCT_INFO] WHERE [ProductClass] ='数码家电'"></asp:SqlDataSource>


            <div class="ListViewPager">
                <asp:DataPager ID="DataPager4" runat="server" PagedControlID="ListView4" PageSize="6">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>

        </asp:View>

    </asp:MultiView>
    </div>
</asp:Content>
