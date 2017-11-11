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
    public partial class VentanaReservaciones : Form
    {

        
        Conexion con = new Conexion();
        MySqlCommand com;
        MySqlDataAdapter da;
        DataTable dt;
        MySqlDataReader dr;
        

        public VentanaReservaciones()
        {
            InitializeComponent();
            mostrar_reservacion();
            radioButton1.Checked = true;
            
            
        }

        public void mostrar_reservacion()
        {
            try
            {
                da = new MySqlDataAdapter("select * from reservacion", Conexion.conexion());
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
            
            string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
            string Query = "insert into reservacion (Nombre, Apellido, Tipo, Habitacion, FechaEntrada, FechaSalida, Monto) values ('" + textBox1.Text + "', '" + textBox2.Text + "', '" + tipoh + "', '" + Convert.ToInt32(comboBox1.Text) + "', '" + maskedTextBox1.Text + "', '" + maskedTextBox2.Text + "', '"+ Convert.ToInt32(textBox4.Text) +"' )  ; ";
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
                comboBox1.SelectedIndex = -1;
                textBox4.Clear();
                textBox5.Clear();
                maskedTextBox1.Clear();
                maskedTextBox2.Clear();

                while (myReader.Read())
                {

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            mostrar_reservacion();
           
        }


        string var_id;
        private void btn_borrar_Click(object sender, EventArgs e)
        {
            string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
            string Query = "delete from reservacion where id_reservacion = '" + textBox5.Text + "' ; ";
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
            mostrar_reservacion();


        }

        private void VentanaReservaciones_Load(object sender, EventArgs e)
        {

        }


        string tipoh;

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
            string Query = "select * from habitacion where NoHabitacion = '" + comboBox1.Text + "'   ; ";
            MySqlConnection conDataBase = new MySqlConnection(constring);
            MySqlCommand cmdDataBase = new MySqlCommand(Query, conDataBase);
            MySqlDataReader myReader;
            try
            {
                conDataBase.Open();
                myReader = cmdDataBase.ExecuteReader();
                while (myReader.Read())
                {

                    string sDes = myReader.GetString("Descripcion");
                    string sCosto = myReader.GetInt32("Costo").ToString();

                    textBox6.Text = sDes;
                    textBox7.Text = sCosto;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


           
        }


       

        
        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            
            string tipohi;
            string disp;
            disp = "Si";
            tipohi = "Individual";
            tipoh = "Individual";
            if (radioButton1.Checked) {
                textBox6.Clear();
                textBox7.Clear();
                comboBox1.SelectedIndex = -1;
                    comboBox1.Items.Clear();
                    string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
                    string Query = "select * from habitacion where Disponibilidad = '" + disp + "' and Tipo ='"+ tipohi +"'   ; ";
                    MySqlConnection conDataBase = new MySqlConnection(constring);
                    MySqlCommand cmdDataBase = new MySqlCommand(Query, conDataBase);
                    MySqlDataReader myReader;
                    try
                    {
                        conDataBase.Open();
                        myReader = cmdDataBase.ExecuteReader();
                       

                        while (myReader.Read())
                        {
                            
                            string sHabitacion = myReader.GetInt32("NoHabitacion").ToString();
                            comboBox1.Items.Add(sHabitacion);

                    }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }

                }
            tipoh = "Individual";

        }

  

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

            

            string tipohd;
            string disp;
            disp = "Si";
            tipohd = "Doble";
                if (radioButton2.Checked)
                {
                textBox6.Clear();
                textBox7.Clear();
                comboBox1.SelectedIndex = -1;
                comboBox1.Items.Clear();
                    string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
                    string Query = "select * from habitacion where Disponibilidad = '" + disp + "' and Tipo ='" + tipohd + "'   ; ";
                    MySqlConnection conDataBase = new MySqlConnection(constring);
                    MySqlCommand cmdDataBase = new MySqlCommand(Query, conDataBase);
                    MySqlDataReader myReader;
                    
                    try
                    {
                        conDataBase.Open();
                        myReader = cmdDataBase.ExecuteReader();


                        while (myReader.Read())
                        {
                            
                            string sHabitacion = myReader.GetInt32("NoHabitacion").ToString();
                            comboBox1.Items.Add(sHabitacion);

                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }

                }

            tipoh = "Doble";


        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            string tipoht;
            string disp;
            disp = "Si";
            tipoht = "Triple";
      
            if (radioButton3.Checked)
            {
                comboBox1.SelectedIndex = -1;
                comboBox1.Items.Clear();
                string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
                string Query = "select * from habitacion where Disponibilidad = '" + disp + "' and Tipo ='" + tipoht + "'   ; ";
                MySqlConnection conDataBase = new MySqlConnection(constring);
                MySqlCommand cmdDataBase = new MySqlCommand(Query, conDataBase);
                MySqlDataReader myReader;
                try
                {
                    conDataBase.Open();
                    myReader = cmdDataBase.ExecuteReader();


                    while (myReader.Read())
                    {

                        string sHabitacion = myReader.GetInt32("NoHabitacion").ToString();
                        comboBox1.Items.Add(sHabitacion);

                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }

            }
            
            tipoh = "Triple";
        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
            string tipohs;
            string disp;
            disp = "Si";
            tipohs= "Suite";
            
            if (radioButton4.Checked)
            {
                comboBox1.SelectedIndex = -1;
                comboBox1.Items.Clear();
                string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
                string Query = "select * from habitacion where Disponibilidad = '" + disp + "' and Tipo ='" + tipohs + "'   ; ";
                MySqlConnection conDataBase = new MySqlConnection(constring);
                MySqlCommand cmdDataBase = new MySqlCommand(Query, conDataBase);
                MySqlDataReader myReader;
                try
                {
                    conDataBase.Open();
                    myReader = cmdDataBase.ExecuteReader();


                    while (myReader.Read())
                    {

                        string sHabitacion = myReader.GetInt32("NoHabitacion").ToString();
                        comboBox1.Items.Add(sHabitacion);

                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }

            }
            
            tipoh = "Suite";
        }

        private void radioButton5_CheckedChanged(object sender, EventArgs e)
        {
            string tipohp;
            string disp;
            disp = "Si";
            tipohp = "Presidencial";

            if (radioButton5.Checked)
            {
                comboBox1.SelectedIndex = -1;
                comboBox1.Items.Clear();
                string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
                string Query = "select * from habitacion where Disponibilidad = '" + disp + "' and Tipo ='" + tipohp + "'   ; ";
                MySqlConnection conDataBase = new MySqlConnection(constring);
                MySqlCommand cmdDataBase = new MySqlCommand(Query, conDataBase);
                MySqlDataReader myReader;
                try
                {
                    conDataBase.Open();
                    myReader = cmdDataBase.ExecuteReader();


                    while (myReader.Read())
                    {

                        string sHabitacion = myReader.GetInt32("NoHabitacion").ToString();
                        comboBox1.Items.Add(sHabitacion);

                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }

            }
            tipoh = "Presidencial";
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.dataGridView1.Rows[e.RowIndex];

                textBox1.Text = row.Cells["Nombre"].Value.ToString();
                textBox2.Text = row.Cells["Apellido"].Value.ToString();
                //comboBox1.Text = row.Cells["Habitacion"].Value.ToString();
                maskedTextBox1.Text = row.Cells["FechaEntrada"].Value.ToString();
                maskedTextBox2.Text = row.Cells["FechaSalida"].Value.ToString();
                textBox4.Text = row.Cells["Monto"].Value.ToString();
                textBox5.Text = row.Cells["Id_reservacion"].Value.ToString();



            }
        }


        

        private void btn_editar_Click(object sender, EventArgs e)
        {
            string constring = "server=127.0.0.1; database=bd_hoteleria; Uid=root; pwd=;";
            string Query = "update reservacion set Nombre = '" + textBox1.Text + "',Apellido='" + textBox2.Text + "',Tipo= '" + tipoh + "', Habitacion= '" + comboBox1.Text + "',FechaEntrada= '" + maskedTextBox1.Text + "',FechaSalida= '" + maskedTextBox2.Text + "',Monto= '" + textBox4.Text + "' where Id_reservacion = '" + textBox5.Text + "'   ; ";
            MySqlConnection conDataBase = new MySqlConnection(constring);
            MySqlCommand cmdDataBase = new MySqlCommand(Query, conDataBase);
            MySqlDataReader myReader;
            textBox1.Clear();
            textBox2.Clear();
            comboBox1.SelectedIndex = -1;
            textBox4.Clear();
            maskedTextBox1.Clear();
            maskedTextBox2.Clear();
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
            mostrar_reservacion();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                da = new MySqlDataAdapter("select * from reservacion where Habitacion like ('" + comboBox1.Text + "%') and Nombre like ('" + textBox1.Text + "%') and Apellido like ('" + textBox2.Text + "%') and Monto like ('" + textBox4.Text + "%') ; ", Conexion.conexion());
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
        

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}
