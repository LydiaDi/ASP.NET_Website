using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace _180808
{
    public class db
    {
        public static SqlConnection getSqlConnection()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DB180808ConnectionString"].ConnectionString.ToString());
            return conn;
        }

        public static SqlDataReader getSqlDataReader(string sqlStr)
        {
            SqlConnection conn = db.getSqlConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlStr, conn);
            SqlDataReader sdr = cmd.ExecuteReader();
            return sdr;
        }

        public static bool ExecuteSqlCommand(string sqlStr)//
        {
            SqlConnection conn = db.getSqlConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlStr, conn);
            try
            {
                if (cmd.ExecuteNonQuery() > 0)
                {
                    return true;
                }
                else { return false; }
            }
            catch (Exception ex) { return false; }
            finally { conn.Close(); }
        }



        //
        public static SqlDataReader getSqlDataReader2(string sqlStr)
        {
            SqlConnection conn = db.getSqlConnection();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlStr, conn);
            SqlDataReader sdr = cmd.ExecuteReader();
            return sdr;
        }
        


        public static DataTable getDataTable(string sqlstr)
        {
            SqlConnection conn = db.getSqlConnection();
            SqlDataAdapter sda = new SqlDataAdapter(sqlstr, conn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "myDataTable");
            return ds.Tables["myDataTable"];
        }
    }
}
