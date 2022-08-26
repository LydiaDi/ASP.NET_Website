using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _180808
{
    public partial class ProductManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            switch (Menu1.SelectedValue)
            {
                case "1":
                    {
                        MultiView1.ActiveViewIndex = 0;
                        break;
                    }
                case "2":
                    {
                        MultiView1.ActiveViewIndex = 1;
                        break;
                    }
               
                    default:
                    break;
            }
        }
    }
}