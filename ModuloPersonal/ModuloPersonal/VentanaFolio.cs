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
    public partial class VentanaFolio : Form
    {

        Conexion con = new Conexion();
        MySqlCommand com;
        MySqlDataAdapter da;
        DataTable dt;
        MySqlDataReader dr;
        public VentanaFolio()
        {
            InitializeComponent();
            Fillcombo();
            mostrar_folio();
            radioButton1.Checked = true;
            radioButton4.Checked = true;
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

        private void VentanaFolio_Load(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
            string Query = "select * from reservacion where Habitacion = '" + comboBox1.Text +"'   ; ";
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

        public void calculo_folio()
        {
            try
            {
                da = new MySqlDataAdapter("select SUM(Monto) as Total, Id_reservacion from folio group by Id_reservacion  ", Conexion.conexion());
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

        private void btn_guardar_Click(object sender, EventArgs e)
        {
            try
            {
                com = new MySqlCommand("insert into folio (Habitacion, Id_reservacion,TipoCliente, Nombre, Apellido, Servicio, Fecha, Monto, Descripcion) values ('" + Convert.ToInt32(comboBox1.Text) + "', '" + Convert.ToInt32(textBox1.Text) + "', '" + tipoc + "' ,'" + textBox2.Text + "', '" + textBox3.Text + "', '" + textBox4.Text + "', '" + Convert.ToString(maskedTextBox1.Text) + "', '" + Convert.ToInt32(textBox5.Text) + "', '" + textBox6.Text + "' )", Conexion.conexion());
                com.ExecuteNonQuery();
                mostrar_folio();
                comboBox1.Text = ""; textBox1.Text = ""; textBox2.Text = ""; textBox3.Text = "";  textBox4.Text = ""; maskedTextBox1.Text = ""; textBox5.Text = ""; textBox6.Text = "";
                MessageBox.Show("Datos Ingresados");
                textBox1.Clear();
                textBox2.Clear();
                textBox3.Clear();
                textBox4.Clear();
                textBox5.Clear();
                textBox6.Clear();
                comboBox1.SelectedIndex = -1;
                maskedTextBox1.Clear();

            }
            catch (Exception ex)
            {
                MessageBox.Show("Datos no ingresados");
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            calculo_folio();
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
                textBox4.Text = row.Cells["Servicio"].Value.ToString();
                maskedTextBox1.Text = row.Cells["Fecha"].Value.ToString();
                textBox5.Text = row.Cells["Monto"].Value.ToString();
                textBox6.Text = row.Cells["Descripcion"].Value.ToString();
                textBox7.Text = row.Cells["Id_gasto"].Value.ToString();
                textBox8.Text = row.Cells["TipoCliente"].Value.ToString();

            }
        }

        private void btn_editar_Click(object sender, EventArgs e)
        {
            string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
            string Query = "update folio set Servicio = '" + textBox4.Text + "',Fecha='" + maskedTextBox1.Text + "',Monto= '" + textBox5.Text + "',Descripcion= '" + textBox6.Text + "',Nombre= '" + textBox2.Text + "',Apellido= '" + textBox3.Text + "',TipoCliente= '" + tipoc + "' where Id_gasto = '" + textBox7.Text + "'   ; ";
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
            mostrar_folio();
        }

        string tipoc;
        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton1.Checked)
            {
                comboBox1.Text ="";
                textBox1.Clear();
                textBox2.Clear();
                textBox3.Clear();
                textBox4.Clear();
                textBox5.Clear();
                textBox6.Clear();
                comboBox1.Enabled = true;
                textBox1.Enabled = false;
                textBox2.Enabled = false;
                textBox3.Enabled = false;

            }


            tipoc = "Huesped";
        }


        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton2.Checked)
            {
                comboBox1.Enabled = false;
                textBox1.Enabled = false;
                textBox2.Enabled = true;
                textBox3.Enabled = true;
                comboBox1.Text = "0";
                textBox1.Text = "0";
            }

            tipoc = "Consumidor";
        }

        private void textBox8_TextChanged(object sender, EventArgs e)
        {
            if (textBox8.Text.Contains("Huesped"))
            {
                textBox2.Enabled = false;
                textBox3.Enabled = false;

            }
            if (textBox8.Text.Contains("Consumidor"))
            {
                textBox2.Enabled = true;
                textBox3.Enabled = true;
                comboBox1.Enabled = false;

            }


        }

        private void btn_borrar_Click(object sender, EventArgs e)
        {
            string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
            string Query = "delete from folio where Id_reservacion = '" + textBox1.Text + "' and Nombre = '" + textBox2.Text + "' and Apellido = '" + textBox3.Text + "' and Habitacion = '" + comboBox1.Text + "' and Id_gasto = '" + textBox7.Text + "' ; ";
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

        private void button2_Click(object sender, EventArgs e)
        {
            
            if (radioButton3.Checked)
            {
                
                try
                {
                    da = new MySqlDataAdapter("select * from folio where Id_reservacion like ('" + textBox1.Text + "%') and TipoCliente like ('" + textBox10.Text + "%') and Habitacion like ('"+ comboBox1.Text + "%') and Id_reservacion like ('"+ textBox1.Text + "%') and Nombre like ('" + textBox2.Text + "%') and Apellido like ('" + textBox3.Text + "%') and Servicio like ('" + textBox4.Text + "%') and Monto like ('" + textBox5.Text + "%') and Descripcion like ('" + textBox6.Text + "%') ", Conexion.conexion());
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




            if (radioButton4.Checked)
            {
                
                try
                {
                    da = new MySqlDataAdapter("select * from folio where Id_reservacion like ('" + textBox1.Text + "%') and TipoCliente like ('" + textBox9.Text + "%') and Habitacion like ('" + comboBox1.Text + "%') and Id_reservacion like ('" + textBox1.Text + "%') and Nombre like ('" + textBox2.Text + "%') and Apellido like ('" + textBox3.Text + "%') and Servicio like ('" + textBox4.Text + "%') and Monto like ('" + textBox5.Text + "%') and Descripcion like ('" + textBox6.Text + "%') ", Conexion.conexion());
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

            if (radioButton5.Checked)
            {
                
                try
                {
                    da = new MySqlDataAdapter("select * from folio where Id_reservacion like ('" + textBox1.Text + "%') and Habitacion like ('" + comboBox1.Text + "%') and Id_reservacion like ('" + textBox1.Text + "%') and Nombre like ('" + textBox2.Text + "%') and Apellido like ('" + textBox3.Text + "%') and Servicio like ('" + textBox4.Text + "%') and Monto like ('" + textBox5.Text + "%') and Descripcion like ('" + textBox6.Text + "%') ", Conexion.conexion());
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

        private void textBox9_TextChanged(object sender, EventArgs e)
        {

        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton4.Checked)
            {
                comboBox1.Text = "";
                textBox1.Clear();
                textBox2.Clear();
                textBox3.Clear();
                textBox4.Clear();
                textBox5.Clear();
                textBox6.Clear();
                comboBox1.Enabled = true;
                textBox1.Enabled = false;
                textBox2.Enabled = false;
                textBox3.Enabled = false;
            }
        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton3.Checked)
            {
                comboBox1.Enabled = false;
                textBox1.Enabled = false;
                textBox2.Enabled = true;
                textBox3.Enabled = true;
                comboBox1.Text = "0";
                textBox1.Text = "0";
            }
        }

        private void radioButton5_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton5.Checked)
            {
                comboBox1.Text = "";
                textBox1.Clear();
                textBox2.Clear();
                textBox3.Clear();
                textBox4.Clear();
                textBox5.Clear();
                textBox6.Clear();
                
            }

        }
    }
}
