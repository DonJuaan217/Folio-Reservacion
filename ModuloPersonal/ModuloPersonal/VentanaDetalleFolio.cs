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
    public partial class VentanaDetalleFolio : Form
    {
        Conexion con = new Conexion();
        MySqlCommand com;
        MySqlDataAdapter da;
        DataTable dt;
        MySqlDataReader dr;
        public VentanaDetalleFolio()
        {
            InitializeComponent();
            Fillcombo();
            mostrar_folio();
            radioButton1.Checked = true;
            
        }

        public void mostrar_folio()
        {
            try
            {
                da = new MySqlDataAdapter("select * from folio", Conexion.conexion());
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


        void Fillcombo()
        {
            string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
            string Query = "select * from reservacion    ; ";
            MySqlConnection conDataBase = new MySqlConnection(constring);
            MySqlCommand cmdDataBase = new MySqlCommand(Query, conDataBase);
            MySqlDataReader myReader;
            try
            {
                conDataBase.Open();
                myReader = cmdDataBase.ExecuteReader();
                while (myReader.Read())
                {
                    string sHabitacion = myReader.GetInt32("Habitacion").ToString();
                    comboBox1.Items.Add(sHabitacion);

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
            string Query = "select * from reservacion where Habitacion = '" + comboBox1.Text + "'   ; ";
            MySqlConnection conDataBase = new MySqlConnection(constring);
            MySqlCommand cmdDataBase = new MySqlCommand(Query, conDataBase);
            MySqlDataReader myReader;
            try
            {
                conDataBase.Open();
                myReader = cmdDataBase.ExecuteReader();
                while (myReader.Read())
                {
                    string sHabitacion = myReader.GetInt32("Habitacion").ToString();
                    string sId_reservacion = myReader.GetInt32("Id_reservacion").ToString();
                    string sNombre = myReader.GetString("Nombre");
                    string sApellido = myReader.GetString("Apellido");

                    textBox1.Text = sId_reservacion;
                    textBox2.Text = sNombre;
                    textBox3.Text = sApellido;


                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public void calculo_folio()
        {
            try
            {
                da = new MySqlDataAdapter("select SUM(Monto) as Total, Nombre, Apellido, Habitacion from folio where Habitacion = '" + comboBox1.Text + "' group by Nombre, Apellido, Habitacion  ", Conexion.conexion());
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

      

        private void button1_Click(object sender, EventArgs e)
        {
            calculo_folio();
        }


        public void gasto_por_cliente()
        {
            if (radioButton1.Checked)
            {
                try
                {
                    da = new MySqlDataAdapter("select * from folio where Id_reservacion = '" + textBox1.Text + "'  ", Conexion.conexion());
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




            if (radioButton2.Checked)
            {
                mostrar_folio();
                try
                {
                    da = new MySqlDataAdapter("select * from folio where Id_reservacion = '" + textBox1.Text + "' and Habitacion = '" + comboBox1.Text + "' and Nombre = '" + textBox2.Text + "' and Apellido = '" + textBox3.Text + "' ", Conexion.conexion());
                    dt = new DataTable();
                    da.Fill(dt);
                    dataGridView1.DataSource = dt;
                    dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("ERROR");
                }
            }//fin if

        }

        private void button2_Click(object sender, EventArgs e)
        {
            
            gasto_por_cliente();

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton1.Checked)
            {
                mostrar_folio();
                comboBox1.Enabled = true;
                textBox1.Enabled = false;
                textBox2.Enabled = false;
                textBox3.Enabled = false;

                comboBox1.Text ="";
                textBox1.Clear();
                textBox2.Clear();
                textBox3.Clear();

            }

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton2.Checked)
            {
                mostrar_folio();
                comboBox1.Text = "0000";
                textBox1.Text = "0000";
                textBox2.Clear();
                textBox3.Clear();
                comboBox1.Enabled = false;
                textBox1.Enabled = false;
                textBox2.Enabled = true;
                textBox3.Enabled = true;

            }
        }

        private void btn_borrar_Click(object sender, EventArgs e)
        {
            if (radioButton1.Checked)
            {
                string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
                string Query = "delete from folio where Id_reservacion = '" + textBox1.Text + "' and Nombre = '" + textBox2.Text + "' and Apellido = '" + textBox3.Text + "' and Habitacion = '" + comboBox1.Text + "' ; ";
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
                mostrar_folio();
            }


            if (radioButton2.Checked)
            {
                string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
                string Query = "delete from folio where Id_reservacion = '" + textBox1.Text + "' and Nombre = '" + textBox2.Text + "' and Apellido = '" + textBox3.Text + "' and Habitacion = '" + comboBox1.Text + "' ; ";
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
                mostrar_folio();
            }

        }//fin metodo

        private void btn_guardar_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];

                comboBox1.Text = row.Cells["Habitacion"].Value.ToString();
                textBox1.Text = row.Cells["Id_reservacion"].Value.ToString();
                textBox2.Text = row.Cells["Nombre"].Value.ToString();
                textBox3.Text = row.Cells["Apellido"].Value.ToString();
                

            }
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            gasto_por_cliente();
        }
    }
}
