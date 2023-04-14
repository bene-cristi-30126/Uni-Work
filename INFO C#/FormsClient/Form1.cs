using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace FormsClient
{
    public partial class Form1 : Form
    {

        FormsClient.ServiceReference1.WebService1SoapClient service =
                new FormsClient.ServiceReference1.WebService1SoapClient();
        public Form1()
        {
            InitializeComponent();

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void Add_List_Click(object sender, EventArgs e)
        {
            List<string> elements = service.PrintElements();
            foreach(var element in elements) 
            {
                listBox1.Items.Add(element);
            }
        }

 

        private void Grade_Click(object sender, EventArgs e)
        {
            int temp = int.Parse(textBox_Temp.Text);
            string unit = textBox_Unit.Text;

            double grade = service.Grade(temp, unit);
            textBox_Rezultat.Text = grade.ToString();
        }

        private void Money_Click(object sender, EventArgs e)
        {
            int money = int.Parse(textBox_Euro.Text);
            string valuta = textBox_Valuta.Text;

            double newmoney = service.Grade(money, valuta);
            textBox_Rezultat.Text = newmoney.ToString();
        }

        private void Timpu_Click(object sender, EventArgs e)
        {
            string timpu = service.Date_Time();
            textBox_Data.Text = timpu;
        }
    }
}
