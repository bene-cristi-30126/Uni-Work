using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SQLite_data
{
    public partial class Form1 : Form
    {

        SqlConnection myCon = new SqlConnection(); 
        DataSet dsUniv; 
        DataSet dsFac;
        public Form1()
        {
            InitializeComponent();
            myCon.ConnectionString = @"Data Source=DESKTOP-B57P6VO\SQLEXPRESS;
        Initial Catalog=database2;Integrated Security=True";


            myCon.Open(); 
            dsUniv = new DataSet(); 
            dsFac = new DataSet(); 
            SqlDataAdapter daUniv = new SqlDataAdapter("SELECT * FROM Universitatea", myCon); 
            daUniv.Fill(dsUniv, "Universitatea");

            SqlDataAdapter daFac = new SqlDataAdapter("SELECT * FROM Facultatii", myCon); 
            daFac.Fill(dsFac, "Facultatii"); 
            foreach (DataRow dr in dsUniv.Tables["Universitatea"].Rows) 
            { 
                String name = dr.ItemArray.GetValue(2).ToString(); 
                listBox_Univ.Items.Add(name); }
            myCon.Close();
        }

        private void listBox_Univ_SelectedIndexChanged(object sender, EventArgs e) 
        { 
            listBox_Fac.Items.Clear(); 
            textBox_City.Clear(); 
            int code = 0; 
            String UnivSelected = listBox_Univ.SelectedItem.ToString(); 
            foreach (DataRow dr in dsUniv.Tables["Universitatea"].Rows) 
            { 
                if (UnivSelected == dr.ItemArray.GetValue(1).ToString()) 
                { 
                    textBox_City.Text = dr.ItemArray.GetValue(2).ToString(); 
                    code = Convert.ToInt16(dr.ItemArray.GetValue(3)); 
                    textBox_CodeUniv.Text = code.ToString(); 
                } 
            } 
            foreach (DataRow dr in dsFac.Tables["Facultatii"].Rows) 
            { 
                if (code == Convert.ToInt16(dr.ItemArray.GetValue(1))) 
                { 
                    String nameFac = dr.ItemArray.GetValue(2).ToString(); 
                    listBox_Fac.Items.Add(nameFac); 
                } 
            } 
        }

        private void Stergere_Click(object sender, EventArgs e)
        {
            myCon.Open();
            int rowIndex = dataGridView1.CurrentCell.RowIndex;
            int id = int.Parse(dataGridView1.SelectedCells[0].Value.ToString());
            string sql = "DELETE Facultatii where Id = " + id;

            SqlCommand command;
            SqlDataAdapter adapter = new SqlDataAdapter();
            command = new SqlCommand(sql, myCon);
            adapter.DeleteCommand = new SqlCommand(sql, myCon);
            adapter.DeleteCommand.ExecuteNonQuery();
            command.Dispose();

            SqlDataAdapter daUniv = new SqlDataAdapter("SELECT * FROM Facultatii", myCon);
            daUniv.Fill(dsUniv, "Facultatii");

            myCon.Close();

            dataGridView1.Rows.RemoveAt(rowIndex);
            listBox_Fac.Refresh();
        }

        private void Adaugare_Click(object sender, EventArgs e)
        {
           myCon.Open();

            int id = int.Parse(textBoxID.Text);
            string Name = textBoxNume.Text;
            int Code = int.Parse(textBoxCod.Text);
            String sql = " INSERT INTO Facultatii(Id,Code,NameFac) values(" + id + "','" + Code + "','" + Name + ")";

            SqlCommand command = new SqlCommand(sql, myCon);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.InsertCommand = new SqlCommand(sql, myCon);
            command.Dispose();

            SqlDataAdapter daFac = new SqlDataAdapter("SELECT * FROM Facultatii", myCon);
            daFac.Fill(dsFac, "Facultatii");

            myCon.Close();
            dataGridView1.Refresh();
         
        }

        private void Inserare_Click(object sender, EventArgs e)
        {
            myCon.Open();

            int id = int.Parse(textBox1.Text);
            string NameUniv = textBoxNameUni.Text;
            string City = textBoxCity.Text;
            int Code = int.Parse(textBoxCode.Text);
            String sql = " INSERT INTO Universitatea(Id,NameUniv,City,Code) values( " + id + ",'" + NameUniv + "','" + City + "'," + Code + ")";

            SqlCommand command = new SqlCommand(sql, myCon);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.InsertCommand = new SqlCommand(sql, myCon);
            adapter.InsertCommand.ExecuteNonQuery();
            command.Dispose();

            SqlDataAdapter daUniv = new SqlDataAdapter("SELECT * FROM Universitatea", myCon);
            daUniv.Fill(dsUniv, "Universitatea");

            myCon.Close();

            listBox_Univ.Items.Add(NameUniv);
        }

        private void SteregereUni_Click(object sender, EventArgs e)
        {
            listBox_Univ.ClearSelected();

            myCon.Open();

            int Code = int.Parse(textBoxCode.Text);
            string sql = "DELETE Universitatea where code = " + Code;
            string nume = null;

            foreach (DataRow dr in dsUniv.Tables["Universitatea"].Rows)
            {
                if (Code == Convert.ToInt32(dr.ItemArray.GetValue(1)))
                    nume = dr.ItemArray.GetValue(2).ToString();
            }

            SqlCommand command;
            SqlDataAdapter adapter = new SqlDataAdapter();
            command = new SqlCommand(sql, myCon);
            adapter.DeleteCommand = new SqlCommand(sql, myCon);
            adapter.DeleteCommand.ExecuteNonQuery();
            command.Dispose();

            SqlDataAdapter daUniv = new SqlDataAdapter("SELECT * FROM Universitatea", myCon);
            daUniv.Fill(dsUniv, "Universitatea");

            myCon.Close();

            if (nume != null)
            {
                listBox_Univ.Items.Remove(nume);
            }
            textBox_City.Clear();
            textBox_CodeUniv.Clear();
        }

        private void Update_Click(object sender, EventArgs e)
        {
            myCon.Open();

            int id = int.Parse(textBox1.Text);
            string NameUniv = textBoxNameUni.Text;
            string City = textBoxCity.Text;
            int Code = int.Parse(textBoxCode.Text);
            string nume = null;
            string sql = "UPDATE Universitatea set NameUniv='" + NameUniv + "',City='" + City + "',Code=" + Code + " where Id=" + id;

            foreach (DataRow dr in dsUniv.Tables["Universitatea"].Rows)
            {
                if (id == Convert.ToInt32(dr.ItemArray.GetValue(0)))
                    nume = dr.ItemArray.GetValue(2).ToString();
            }

            SqlCommand command = new SqlCommand(sql, myCon);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.InsertCommand = new SqlCommand(sql, myCon);
            adapter.InsertCommand.ExecuteNonQuery();
            command.Dispose();

            SqlDataAdapter daUniv = new SqlDataAdapter("SELECT * FROM Universitatea", myCon);

            myCon.Close();

            if (nume != null)
            {
                listBox_Univ.Items.Remove(nume);
                listBox_Univ.Items.Add(NameUniv);
            }
        }





        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'database2DataSet.Facultatii' table. You can move, or remove it, as needed.
            this.facultatiiTableAdapter.Fill(this.database2DataSet.Facultatii);
            

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void listBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
