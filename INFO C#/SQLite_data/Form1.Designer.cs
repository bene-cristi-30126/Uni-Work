namespace SQLite_data
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.listBox_Univ = new System.Windows.Forms.ListBox();
            this.listBox_Fac = new System.Windows.Forms.ListBox();
            this.textBox_City = new System.Windows.Forms.TextBox();
            this.textBox_CodeUniv = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.textBoxID = new System.Windows.Forms.TextBox();
            this.textBoxCod = new System.Windows.Forms.TextBox();
            this.textBoxNume = new System.Windows.Forms.TextBox();
            this.Adaugare = new System.Windows.Forms.Button();
            this.Stergere = new System.Windows.Forms.Button();
            this.universitati1BindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.database2DataSetBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.database2DataSet = new SQLite_data.database2DataSet();
            this.universitati1TableAdapter = new SQLite_data.database2DataSetTableAdapters.Universitati1TableAdapter();
            this.Inserare = new System.Windows.Forms.Button();
            this.SteregereUni = new System.Windows.Forms.Button();
            this.Update = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBoxNameUni = new System.Windows.Forms.TextBox();
            this.textBoxCity = new System.Windows.Forms.TextBox();
            this.textBoxCode = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.idDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.codeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nameFacDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.facultatiiBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.facultatiiTableAdapter = new SQLite_data.database2DataSetTableAdapters.FacultatiiTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.universitati1BindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.database2DataSetBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.database2DataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.facultatiiBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(42, 27);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(73, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Universitati";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(288, 27);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(60, 16);
            this.label2.TabIndex = 1;
            this.label2.Text = "Facultatii";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(288, 155);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(39, 16);
            this.label3.TabIndex = 2;
            this.label3.Text = "Oras:";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(288, 223);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(65, 16);
            this.label4.TabIndex = 3;
            this.label4.Text = "Cod Univ:";
            // 
            // listBox_Univ
            // 
            this.listBox_Univ.FormattingEnabled = true;
            this.listBox_Univ.ItemHeight = 16;
            this.listBox_Univ.Location = new System.Drawing.Point(45, 46);
            this.listBox_Univ.Name = "listBox_Univ";
            this.listBox_Univ.Size = new System.Drawing.Size(209, 228);
            this.listBox_Univ.TabIndex = 4;
            // 
            // listBox_Fac
            // 
            this.listBox_Fac.FormattingEnabled = true;
            this.listBox_Fac.ItemHeight = 16;
            this.listBox_Fac.Location = new System.Drawing.Point(291, 56);
            this.listBox_Fac.Name = "listBox_Fac";
            this.listBox_Fac.Size = new System.Drawing.Size(120, 84);
            this.listBox_Fac.TabIndex = 5;
            this.listBox_Fac.SelectedIndexChanged += new System.EventHandler(this.listBox2_SelectedIndexChanged);
            // 
            // textBox_City
            // 
            this.textBox_City.Location = new System.Drawing.Point(291, 185);
            this.textBox_City.Name = "textBox_City";
            this.textBox_City.Size = new System.Drawing.Size(100, 22);
            this.textBox_City.TabIndex = 6;
            // 
            // textBox_CodeUniv
            // 
            this.textBox_CodeUniv.Location = new System.Drawing.Point(291, 252);
            this.textBox_CodeUniv.Name = "textBox_CodeUniv";
            this.textBox_CodeUniv.Size = new System.Drawing.Size(100, 22);
            this.textBox_CodeUniv.TabIndex = 7;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(475, 27);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(120, 16);
            this.label5.TabIndex = 8;
            this.label5.Text = "Adaugare Facultati";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(478, 56);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(20, 16);
            this.label6.TabIndex = 9;
            this.label6.Text = "ID";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(597, 56);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(32, 16);
            this.label7.TabIndex = 10;
            this.label7.Text = "Cod";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(685, 56);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(43, 16);
            this.label8.TabIndex = 11;
            this.label8.Text = "Nume";
            // 
            // textBoxID
            // 
            this.textBoxID.Location = new System.Drawing.Point(478, 86);
            this.textBoxID.Name = "textBoxID";
            this.textBoxID.Size = new System.Drawing.Size(63, 22);
            this.textBoxID.TabIndex = 12;
            // 
            // textBoxCod
            // 
            this.textBoxCod.Location = new System.Drawing.Point(591, 86);
            this.textBoxCod.Name = "textBoxCod";
            this.textBoxCod.Size = new System.Drawing.Size(63, 22);
            this.textBoxCod.TabIndex = 13;
            // 
            // textBoxNume
            // 
            this.textBoxNume.Location = new System.Drawing.Point(688, 86);
            this.textBoxNume.Name = "textBoxNume";
            this.textBoxNume.Size = new System.Drawing.Size(100, 22);
            this.textBoxNume.TabIndex = 14;
            // 
            // Adaugare
            // 
            this.Adaugare.Location = new System.Drawing.Point(579, 128);
            this.Adaugare.Name = "Adaugare";
            this.Adaugare.Size = new System.Drawing.Size(99, 23);
            this.Adaugare.TabIndex = 15;
            this.Adaugare.Text = "Adaugare";
            this.Adaugare.UseVisualStyleBackColor = true;
            this.Adaugare.Click += new System.EventHandler(this.Adaugare_Click);
            // 
            // Stergere
            // 
            this.Stergere.Location = new System.Drawing.Point(228, 325);
            this.Stergere.Name = "Stergere";
            this.Stergere.Size = new System.Drawing.Size(99, 23);
            this.Stergere.TabIndex = 16;
            this.Stergere.Text = "Stergere";
            this.Stergere.UseVisualStyleBackColor = true;
            this.Stergere.Click += new System.EventHandler(this.Stergere_Click);
            // 
            // universitati1BindingSource
            // 
            this.universitati1BindingSource.DataMember = "Universitati1";
            this.universitati1BindingSource.DataSource = this.database2DataSetBindingSource;
            // 
            // database2DataSetBindingSource
            // 
            this.database2DataSetBindingSource.DataSource = this.database2DataSet;
            this.database2DataSetBindingSource.Position = 0;
            // 
            // database2DataSet
            // 
            this.database2DataSet.DataSetName = "database2DataSet";
            this.database2DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // universitati1TableAdapter
            // 
            this.universitati1TableAdapter.ClearBeforeFill = true;
            // 
            // Inserare
            // 
            this.Inserare.Location = new System.Drawing.Point(539, 325);
            this.Inserare.Name = "Inserare";
            this.Inserare.Size = new System.Drawing.Size(75, 23);
            this.Inserare.TabIndex = 18;
            this.Inserare.Text = "Inserare";
            this.Inserare.UseVisualStyleBackColor = true;
            this.Inserare.Click += new System.EventHandler(this.Inserare_Click);
            // 
            // SteregereUni
            // 
            this.SteregereUni.Location = new System.Drawing.Point(665, 325);
            this.SteregereUni.Name = "SteregereUni";
            this.SteregereUni.Size = new System.Drawing.Size(75, 23);
            this.SteregereUni.TabIndex = 19;
            this.SteregereUni.Text = "Stergere";
            this.SteregereUni.UseVisualStyleBackColor = true;
            this.SteregereUni.Click += new System.EventHandler(this.SteregereUni_Click);
            // 
            // Update
            // 
            this.Update.Location = new System.Drawing.Point(791, 325);
            this.Update.Name = "Update";
            this.Update.Size = new System.Drawing.Size(75, 23);
            this.Update.TabIndex = 20;
            this.Update.Text = "Update";
            this.Update.UseVisualStyleBackColor = true;
            this.Update.Click += new System.EventHandler(this.Update_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(469, 252);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(100, 22);
            this.textBox1.TabIndex = 21;
            // 
            // textBoxNameUni
            // 
            this.textBoxNameUni.Location = new System.Drawing.Point(591, 252);
            this.textBoxNameUni.Name = "textBoxNameUni";
            this.textBoxNameUni.Size = new System.Drawing.Size(100, 22);
            this.textBoxNameUni.TabIndex = 22;
            // 
            // textBoxCity
            // 
            this.textBoxCity.Location = new System.Drawing.Point(713, 252);
            this.textBoxCity.Name = "textBoxCity";
            this.textBoxCity.Size = new System.Drawing.Size(100, 22);
            this.textBoxCity.TabIndex = 23;
            // 
            // textBoxCode
            // 
            this.textBoxCode.Location = new System.Drawing.Point(834, 252);
            this.textBoxCode.Name = "textBoxCode";
            this.textBoxCode.Size = new System.Drawing.Size(100, 22);
            this.textBoxCode.TabIndex = 24;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(469, 222);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(20, 16);
            this.label9.TabIndex = 25;
            this.label9.Text = "ID";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(588, 222);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(71, 16);
            this.label10.TabIndex = 26;
            this.label10.Text = "NameUniv";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(713, 222);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(29, 16);
            this.label11.TabIndex = 27;
            this.label11.Text = "City";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(834, 222);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(40, 16);
            this.label12.TabIndex = 28;
            this.label12.Text = "Code";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(472, 185);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(120, 16);
            this.label13.TabIndex = 29;
            this.label13.Text = "Operati Universitati";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.idDataGridViewTextBoxColumn,
            this.codeDataGridViewTextBoxColumn,
            this.nameFacDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.facultatiiBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(45, 383);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(505, 150);
            this.dataGridView1.TabIndex = 30;
            // 
            // idDataGridViewTextBoxColumn
            // 
            this.idDataGridViewTextBoxColumn.DataPropertyName = "Id";
            this.idDataGridViewTextBoxColumn.HeaderText = "Id";
            this.idDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.idDataGridViewTextBoxColumn.Name = "idDataGridViewTextBoxColumn";
            this.idDataGridViewTextBoxColumn.Width = 125;
            // 
            // codeDataGridViewTextBoxColumn
            // 
            this.codeDataGridViewTextBoxColumn.DataPropertyName = "Code";
            this.codeDataGridViewTextBoxColumn.HeaderText = "Code";
            this.codeDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.codeDataGridViewTextBoxColumn.Name = "codeDataGridViewTextBoxColumn";
            this.codeDataGridViewTextBoxColumn.Width = 125;
            // 
            // nameFacDataGridViewTextBoxColumn
            // 
            this.nameFacDataGridViewTextBoxColumn.DataPropertyName = "NameFac";
            this.nameFacDataGridViewTextBoxColumn.HeaderText = "NameFac";
            this.nameFacDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.nameFacDataGridViewTextBoxColumn.Name = "nameFacDataGridViewTextBoxColumn";
            this.nameFacDataGridViewTextBoxColumn.Width = 125;
            // 
            // facultatiiBindingSource
            // 
            this.facultatiiBindingSource.DataMember = "Facultatii";
            this.facultatiiBindingSource.DataSource = this.database2DataSetBindingSource;
            // 
            // facultatiiTableAdapter
            // 
            this.facultatiiTableAdapter.ClearBeforeFill = true;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1049, 601);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.textBoxCode);
            this.Controls.Add(this.textBoxCity);
            this.Controls.Add(this.textBoxNameUni);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.Update);
            this.Controls.Add(this.SteregereUni);
            this.Controls.Add(this.Inserare);
            this.Controls.Add(this.Stergere);
            this.Controls.Add(this.Adaugare);
            this.Controls.Add(this.textBoxNume);
            this.Controls.Add(this.textBoxCod);
            this.Controls.Add(this.textBoxID);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.textBox_CodeUniv);
            this.Controls.Add(this.textBox_City);
            this.Controls.Add(this.listBox_Fac);
            this.Controls.Add(this.listBox_Univ);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.universitati1BindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.database2DataSetBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.database2DataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.facultatiiBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ListBox listBox_Univ;
        private System.Windows.Forms.ListBox listBox_Fac;
        private System.Windows.Forms.TextBox textBox_City;
        private System.Windows.Forms.TextBox textBox_CodeUniv;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox textBoxID;
        private System.Windows.Forms.TextBox textBoxCod;
        private System.Windows.Forms.TextBox textBoxNume;
        private System.Windows.Forms.Button Adaugare;
        private System.Windows.Forms.Button Stergere;
        private System.Windows.Forms.BindingSource database2DataSetBindingSource;
        private database2DataSet database2DataSet;
        private System.Windows.Forms.BindingSource universitati1BindingSource;
        private database2DataSetTableAdapters.Universitati1TableAdapter universitati1TableAdapter;
        private System.Windows.Forms.Button Inserare;
        private System.Windows.Forms.Button SteregereUni;
        private System.Windows.Forms.Button Update;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBoxNameUni;
        private System.Windows.Forms.TextBox textBoxCity;
        private System.Windows.Forms.TextBox textBoxCode;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.BindingSource facultatiiBindingSource;
        private database2DataSetTableAdapters.FacultatiiTableAdapter facultatiiTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn idDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn codeDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn nameFacDataGridViewTextBoxColumn;
    }
}

