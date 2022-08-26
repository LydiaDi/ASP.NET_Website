using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _180808
{
    public partial class index : System.Web.UI.Page
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
                case "3":
                    {
                        MultiView1.ActiveViewIndex = 2;
                        break;
                    }
                case "4":
                    {
                        MultiView1.ActiveViewIndex = 3;
                        break;
                    }
                case "5":
                    {
                        MultiView1.ActiveViewIndex = 4;
                        break;
                    }
                case "6":
                    {
                        MultiView1.ActiveViewIndex = 5;
                        break;
                    }
                case "7":
                    {
                        MultiView1.ActiveViewIndex = 6;
                        break;
                    }
                case "8":
                    {
                        MultiView1.ActiveViewIndex = 7;
                        break;
                    }
                default:
                    break;
            }
        }
        

        
        
        
    }
}