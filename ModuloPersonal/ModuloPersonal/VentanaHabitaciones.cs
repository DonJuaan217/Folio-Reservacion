using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data;
using MySql.Data.MySqlClient;


namespace ModuloPersonal
{
    public partial class VentanaHabitaciones : Form
    {

        Conexion con = new Conexion();
        MySqlCommand com;
        MySqlDataAdapter da;
        DataTable dt;
        MySqlDataReader dr;

        public VentanaHabitaciones()
        {
            InitializeComponent();
            mostrar_habitaciones();
        }


        public void mostrar_habitaciones()
        {
            try
            {
                da = new MySqlDataAdapter("select * from habitacion", Conexion.conexion());
                dt = new DataTable();
                da.Fill(dt);
                dataGridView1.DataSource = dt;
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR");
            }
        }


        string Tipoh;
        string disp;

        private void btn_guardar_Click(object sender, EventArgs e)
        {
            string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
            string Query = "insert into habitacion (NoHabitacion, Tipo, Descripcion, Costo, Disponibilidad) values ('" + Convert.ToInt32(textBox1.Text) + "','" + comboBox1.Text + "', '"+textBox2.Text+"', '" + Convert.ToInt32(textBox3.Text) + "' ,'"+ comboBox2.Text+"' )  ; ";
            MySqlConnection conDataBase = new MySqlConnection(constring);
            MySqlCommand cmdDataBase = new MySqlCommand(Query, conDataBase);
            MySqlDataReader myReader;
            try
            {
                conDataBase.Open();
                myReader = cmdDataBase.ExecuteReader();
                MessageBox.Show("Datos ingresados");
                textBox1.Clear();
                textBox2.Clear();
                textBox3.Clear();
                comboBox1.SelectedIndex = -1;
                comboBox2.SelectedIndex = -1;
                while (myReader.Read())
                {

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            mostrar_habitaciones();
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            Tipoh = "Individual";
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            Tipoh = "Doble";
        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            Tipoh = "Triple";
        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
            Tipoh = "Suite";
        }

        private void radioButton5_CheckedChanged(object sender, EventArgs e)
        {
            Tipoh = "Presidencial";
        }

        private void radioButton10_CheckedChanged(object sender, EventArgs e)
        {
            disp = "Si";
        }

        private void radioButton9_CheckedChanged(object sender, EventArgs e)
        {
            disp = "No";
        }

        private void btn_editar_Click(object sender, EventArgs e)
        {
            string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
            string Query = "update habitacion set NoHabitacion = '" + textBox1.Text + "',Tipo='" + comboBox1.Text + "',Descripcion= '" + textBox2.Text + "',Disponibilidad= '" + comboBox2.Text + "' where NoHabitacion = '" + textBox1.Text + "'   ; ";
            MySqlConnection conDataBase = new MySqlConnection(constring);
            MySqlCommand cmdDataBase = new MySqlCommand(Query, conDataBase);
            MySqlDataReader myReader;
            try
            {
                conDataBase.Open();
                myReader = cmdDataBase.ExecuteReader();
                MessageBox.Show("Datos actualizados");
                while (myReader.Read())
                {

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            mostrar_habitaciones();

        }

        string tipohi;
        string tipohd;
        string tipoht;
        string tipohs;
        string tipohp;

        

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            tipohi = "Individual";
            tipohd = "Doble";
            tipoht = "Triple";
            tipohs = "Suite";
            tipohp = "Presidencial";

            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];

                textBox1.Text = row.Cells["NoHabitacion"].Value.ToString();
                textBox2.Text = row.Cells["Descripcion"].Value.ToString();
                comboBox1.Text = row.Cells["Tipo"].Value.ToString();
                comboBox2.Text = row.Cells["Disponibilidad"].Value.ToString();




            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btn_borrar_Click(object sender, EventArgs e)
        {
            string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
            string Query = "delete from habitacion where NoHabitacion = '" + textBox1.Text + "' ; ";
            MySqlConnection conDataBase = new MySqlConnection(constring);
            MySqlCommand cmdDataBase = new MySqlCommand(Query, conDataBase);
            MySqlDataReader myReader;
            try
            {
                conDataBase.Open();
                myReader = cmdDataBase.ExecuteReader();
                MessageBox.Show("Datos eliminados");
                while (myReader.Read())
                {

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            mostrar_habitaciones();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                da = new MySqlDataAdapter("select * from habitacion where disponibilidad  like ('" + comboBox2.Text + "%') and tipo like ('" + comboBox1.Text + "%') and NoHabitacion like ('" + textBox1.Text + "%') and Descripcion like ('" + textBox2.Text + "%') ", Conexion.conexion());
                dt = new DataTable();
                da.Fill(dt);
                dataGridView1.DataSource = dt;
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR");
            }
        }
    }
}
