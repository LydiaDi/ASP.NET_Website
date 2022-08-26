using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Product
/// </summary>
public class Product
{
	public Product()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static DataTable getProductInfoById(string ProductID)
    {
        string sqlstr = "Select * From [PRODUCT_INFO] Where [ProductID]=" + ProductID;
        return db.getDataTable(sqlstr);
    }
}