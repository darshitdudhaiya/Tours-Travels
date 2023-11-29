using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace AARAATOURS.Common
{
    public class Services
    {

        //SqlConnection con = new SqlConnection("Data Source=DD\\SQLEXPRESS;Initial Catalog=tours;Integrated Security=True");
        internal static int execute(string sql, SqlConnection con)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            int affectedRows = cmd.ExecuteNonQuery();
            return affectedRows;
            con.Close();
        }


        internal static DataTable select(string sql, SqlConnection con)
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
            con.Close();
        }

    }
}