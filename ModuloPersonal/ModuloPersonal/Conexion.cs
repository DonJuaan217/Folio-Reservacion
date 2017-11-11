using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data;
using MySql.Data.MySqlClient;


namespace ModuloPersonal
{
    public class Conexion
    {
        public static MySqlConnection conexion()
        {
            MySqlConnection con = new MySqlConnection();
            con = new MySqlConnection("server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;");
            con.Open();
            return con;
        }
    }
}
