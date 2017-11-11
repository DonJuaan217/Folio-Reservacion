using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ModuloPersonal
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Conexion.conexion();
            MessageBox.Show("Conectado");
        }

        private void reservacionesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void realizarReservacionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            VentanaReservaciones ir = new VentanaReservaciones();
            ir.ShowDialog();

        }

        private void folioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            

        }

        private void ingresoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            VentanaFolio ir = new VentanaFolio();
            ir.ShowDialog();
        }

        private void detalleFolioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            VentanaDetalleFolio ir = new VentanaDetalleFolio();
            ir.ShowDialog();
        }

        private void habitacionToolStripMenuItem_Click(object sender, EventArgs e)
        {
            VentanaHabitaciones ir = new VentanaHabitaciones();
            ir.ShowDialog();

        }
    }
}
