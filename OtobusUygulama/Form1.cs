using Microsoft.VisualBasic;
using OtobusUygulama.Db;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace OtobusUygulama
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        OTOBUSDBEntities db;

        private void btnBiletKes_Click(object sender, EventArgs e)
        {
            gboxBilet.Visible = true;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            db = new OTOBUSDBEntities();
            OtobusveSeferDoldur();
        }

        void OtobusveSeferDoldur()
        {
            var kalkisYeriList = db.Sefer_Tablosu.Select(x => new
            {
                x.SehirID,
                x.Sehir
            }).ToList();

            cmbKalkis.DisplayMember = "Sehir";
            cmbKalkis.ValueMember = "SehirID";
            cmbKalkis.DataSource = kalkisYeriList;

            var varisYeriList = db.Sefer_Tablosu.Select(x => new
            {
                x.SehirID,
                x.Sehir
            }).ToList();
            cmbVaris.DisplayMember = "Sehir";
            cmbVaris.ValueMember = "SehirID";
            cmbVaris.DataSource = varisYeriList;

            var otobusPlaka = db.OtobusBilgi_Tablosu.Select(x => new
            {
                x.OtobusID,
                x.OtobusPlaka,
            }).ToList();
            cmbOtobus.DisplayMember = "OtobusPlaka";
            cmbOtobus.ValueMember = "OtobusID";
            cmbOtobus.DataSource = otobusPlaka;

            var otobusListe = db.OtobusBilgi_Tablosu.Select(x => new
            {
                x.OtobusID,
                x.OtobusPlaka,
            }).ToList();
            cmbOtobusListe.DisplayMember = "OtobusPlaka";
            cmbOtobusListe.ValueMember = "OtobusID";
            cmbOtobusListe.DataSource = otobusListe;

            var otobusListe2 = db.OtobusBilgi_Tablosu.Select(x => new
            {
                x.OtobusID,
                x.OtobusPlaka,
            }).ToList();
            cmbOtobusHareket.DisplayMember = "OtobusPlaka";
            cmbOtobusHareket.ValueMember = "OtobusID";
            cmbOtobusHareket.DataSource = otobusListe2;

        }
        void BiletKes(Button button,Button button2)
        {
            string adSoyadAl = Interaction.InputBox("Ad Soyad Giriniz.", "Rezervasyon İşlemi", "", 0, 0);
            if ((string)adSoyadAl == "")
            {
                MessageBox.Show("Rezervasyon İşleminiz İptal Edildi.");
            }
            else
            {
                MessageBoxManager.Yes = "Erkek";
                MessageBoxManager.No = "Kadın";
                MessageBoxManager.Register();
                DialogResult cinsiyetAl = MessageBox.Show("Lütfen Cinsiyet Seçimi Yapınız..", "Rezervasyon İşlemi", MessageBoxButtons.YesNo);
                DialogResult rezervasyonOnay = MessageBox.Show($"{adSoyadAl} isimli müşterimiz {cmbOtobus.GetItemText(this.cmbOtobus.SelectedItem)} plakalı otobüs ile {button.Text} numaralı koltukta {cmbKalkis.GetItemText(this.cmbKalkis.SelectedItem)} şehrinden --> {cmbVaris.GetItemText(this.cmbVaris.SelectedItem)} şehrine gitmek istiyor. \n Onaylıyor musunuz ? ", "Rezervasyon İşlemi", MessageBoxButtons.OKCancel);
                SeferBilgisi_Tablosu sfb = new SeferBilgisi_Tablosu();
                if (rezervasyonOnay == DialogResult.OK)
                {

                    if (button2.BackColor == Color.Blue || Convert.ToInt32(button.Text) < 7)
                    {
                        if (cinsiyetAl == DialogResult.Yes)
                        {
                            button.BackColor = Color.Blue;
                            button.Enabled = false;
                            sfb.CinsiyetID = 1;
                            sfb.AdSoyad = adSoyadAl;
                            sfb.RezervID = ((cmbOtobus.SelectedIndex + 1) * 100) + (Convert.ToInt32(button.Text));
                            sfb.KalkisYeriID = cmbKalkis.SelectedIndex + 1;
                            sfb.VarisYeriID = cmbVaris.SelectedIndex + 1;

                            db.SeferBilgisi_Tablosu.Add(sfb);
                            db.SaveChanges();
                        }
                        else
                        {
                            MessageBox.Show("Kadın Seçim Yapamazsınız. Rezervasyon İşleminiz İptal Edildi.");
                        }
                    }
                    else if (button2.BackColor == Color.Pink || Convert.ToInt32(button.Text) < 7)
                    {
                        if (cinsiyetAl == DialogResult.No)
                        {
                            button.BackColor = Color.Pink;
                            button.Enabled = false;
                            sfb.CinsiyetID = 2;
                            sfb.AdSoyad = adSoyadAl;
                            sfb.RezervID = ((cmbOtobus.SelectedIndex + 1) * 100) + (Convert.ToInt32(button.Text));
                            sfb.KalkisYeriID = cmbKalkis.SelectedIndex + 1;
                            sfb.VarisYeriID = cmbVaris.SelectedIndex + 1;

                            db.SeferBilgisi_Tablosu.Add(sfb);
                            db.SaveChanges();
                        }
                        else
                        {
                            MessageBox.Show("Erkek Seçim Yapamazsınız. Rezervasyon İşleminiz İptal Edildi.");
                        }
                    }
                    else
                    {
                        if (cinsiyetAl == DialogResult.Yes)
                        {
                            button.BackColor = Color.Blue;
                            button.Enabled = false;
                            sfb.CinsiyetID = 1;
                        }
                        else if (cinsiyetAl == DialogResult.No)
                        {
                            button.BackColor = Color.Pink;
                            button.Enabled = false;
                            sfb.CinsiyetID = 2;
                        }
                        sfb.AdSoyad = adSoyadAl;
                        sfb.RezervID = ((cmbOtobus.SelectedIndex + 1) * 100) + (Convert.ToInt32(button.Text));
                        sfb.KalkisYeriID = cmbKalkis.SelectedIndex + 1;
                        sfb.VarisYeriID = cmbVaris.SelectedIndex + 1;

                        db.SeferBilgisi_Tablosu.Add(sfb);
                        db.SaveChanges();
                    }             
                }
                else
                {
                    MessageBox.Show("Rezervasyon İşleminiz İptal Edildi.");
                }
                MessageBoxManager.Unregister();
            }
        }

        int secilenID;
        private void cmbOtobus_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (var button in Controls.OfType<GroupBox>().SelectMany(groupBox => gboxBilet.Controls.OfType<Button>()))
            {
                button.Enabled = true;
                button.BackColor = Color.Moccasin;
            }
            secilenID = (cmbOtobus.SelectedIndex) + 1;
            var secilenOtobus = db.OtobusBilgi_Tablosu.Find(secilenID);

            lblModel.Text = secilenOtobus.OtobusModel;
            switch (secilenID)
            {
                case 1:
                    pictureBox1.Image = OtobusUygulama.Properties.Resources.Hiace;
                    break;
                case 2:
                    pictureBox1.Image = OtobusUygulama.Properties.Resources.NV350;
                    break;
                case 3:
                    pictureBox1.Image = OtobusUygulama.Properties.Resources.Sprinter;
                    break;
                case 4:
                    pictureBox1.Image = OtobusUygulama.Properties.Resources.Transit;
                    break;
            }
            foreach (var item in db.SeferBilgisi_Tablosu.ToList())
            {
                if ((item.RezervID / 100) == cmbOtobus.SelectedIndex + 1)
                {
                    foreach (var button in Controls.OfType<GroupBox>().SelectMany(groupBox => gboxBilet.Controls.OfType<Button>()))
                    {
                        if ((item.RezervID % 100).ToString() == button.Text)
                        {
                            button.Enabled = false;
                            if (item.CinsiyetID == 2)
                            {
                                button.BackColor = Color.Pink;
                            }
                            else
                            {
                                button.BackColor = Color.Blue;
                            }
                        }
                    }
                }
            }
        }
        private void cmbKalkis_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button12_Click(object sender, EventArgs e)
        {
            BiletKes(button12,button13);
        }

        private void button13_Click(object sender, EventArgs e)
        {
            BiletKes(button13, button12);
        }

        private void button10_Click(object sender, EventArgs e)
        {
            BiletKes(button10, button11);
        }

        private void button11_Click(object sender, EventArgs e)
        {
            BiletKes(button11, button10);
        }

        private void button8_Click(object sender, EventArgs e)
        {
            BiletKes(button8, button9);
        }

        private void button9_Click(object sender, EventArgs e)
        {
            BiletKes(button9, button8);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            BiletKes(button1, button1);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            BiletKes(button2, button2);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            BiletKes(button3, button3);
        }

        private void button5_Click(object sender, EventArgs e)
        {
            BiletKes(button5, button5);
        }

        private void button6_Click(object sender, EventArgs e)
        {
            BiletKes(button6, button6);
        }

        private void button7_Click(object sender, EventArgs e)
        {
            BiletKes(button7, button7);
        }
        private void btnKontrol_Click(object sender, EventArgs e)
        {
            gboxKontrol.Visible = true;            

            lstPlaka.DataSource = db.SeferBilgisi_Tablosu.Where(x => x.RezervID/100 == x.OtobusKoltukDuzeni_Tablosu.OtobusID).Select(x => new { x.OtobusKoltukDuzeni_Tablosu.OtobusBilgi_Tablosu.OtobusPlaka }).ToList();
            lstPlaka.DisplayMember = "OtobusPlaka";

            lstKoltukNo.DataSource = db.SeferBilgisi_Tablosu.Where(x => x.RezervID / 100 == x.OtobusKoltukDuzeni_Tablosu.OtobusID).Select(x => new { x.OtobusKoltukDuzeni_Tablosu.KoltukID }).ToList();
            lstKoltukNo.DisplayMember = "KoltukID";

            lstSeferBilgisi.DataSource = db.SeferBilgisi_Tablosu
                .Where(x => x.RezervID / 100 == x.OtobusKoltukDuzeni_Tablosu.OtobusID)
                .Select(x => new
                {
                    Kalkis = db.SeferBilgisi_Tablosu.FirstOrDefault(a => x.Sefer_Tablosu.SehirID == a.KalkisYeriID).Sefer_Tablosu.Sehir + " -> " + db.SeferBilgisi_Tablosu.FirstOrDefault(a => x.Sefer_Tablosu.SehirID == a.VarisYeriID).Sefer_Tablosu.Sehir,
                    x.InfoID,

                }).ToList();

            lstSeferBilgisi.DisplayMember = "Kalkis";

            lstAdSoyad.DataSource = db.SeferBilgisi_Tablosu.Where(x => x.RezervID / 100 == x.OtobusKoltukDuzeni_Tablosu.OtobusID).Select(x => new { x.AdSoyad }).ToList();
            lstAdSoyad.DisplayMember = "AdSoyad";
            lstTutar.DataSource = db.SeferBilgisi_Tablosu.Where(x => x.RezervID / 100 == x.OtobusKoltukDuzeni_Tablosu.OtobusID).Select(x => new { x.OtobusKoltukDuzeni_Tablosu.Koltuklar_Tablosu.FiyatBilgisi }).ToList();
            lstTutar.DisplayMember = "FiyatBilgisi";
            

        }
        int otobusID;
        private void cmbOtobusListe_SelectedIndexChanged(object sender, EventArgs e)
        {
            otobusID = (int)cmbOtobusListe.SelectedValue;
            textBox1.Text = db.SeferBilgisi_Tablosu.Where(x => x.RezervID / 100 == otobusID).Sum(y => y.OtobusKoltukDuzeni_Tablosu.Koltuklar_Tablosu.FiyatBilgisi).ToString();
        }

        private void btnAracTakip_Click(object sender, EventArgs e)
        {
            gboxAracTakip.Visible = true;

        }

        private void cmbOtobusHareket_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbOtobusListe.SelectedIndex = cmbOtobusHareket.SelectedIndex;
            int takipEdilecekArac = (int)cmbOtobusHareket.SelectedValue;
            var yolcuListesi = db.SeferBilgisi_Tablosu.Where(x => x.RezervID / 100 == takipEdilecekArac).Select(y => new { y.InfoID }).ToList();
            textBox3.Text = yolcuListesi.Count.ToString();
            textBox2.Text = lstSeferBilgisi.Text;
        }
        int silinecekID;
        private void button4_Click(object sender, EventArgs e)
        {
            lstPlakaTakip.Items.Add(cmbOtobusHareket.Text);
            lstTarih.Items.Add(TarihAl());
            listBox8.Items.Add(textBox1.Text);
        }
        string SeferTarihi;
        private string TarihAl()
        {
            return SeferTarihi = DateTime.Now.ToString();

        }
        private void btnAracKaydet_Click(object sender, EventArgs e)
        {

            GünlükRapor rapor = new GünlükRapor();
            rapor.ToplamHasilat = Convert.ToDecimal(textBox1.Text);
            rapor.OtobusID = otobusID;
            rapor.Tarih = DateTime.Now;
            foreach (var item in db.SeferBilgisi_Tablosu.ToList())
            {
                if (item.RezervID/100 == rapor.OtobusID)
                {
                    silinecekID = Convert.ToInt16(item.InfoID.ToString());
                    var silinecekBilet = db.SeferBilgisi_Tablosu.Find(silinecekID);
                    db.SeferBilgisi_Tablosu.Remove(silinecekBilet);
                }

            }

            db.GünlükRapor.Add(rapor);
            db.SaveChanges();
            MessageBox.Show("Araç verileri kaydedilmiştir");
        }

        private void btnArsiv_Click(object sender, EventArgs e)
        {
            foreach (var item in db.GünlükRapor.ToList())
            {
                lstArsiv.Items.Add(item.OtobusBilgi_Tablosu.OtobusPlaka);
                lstArsiv.Items.Add(item.Tarih);
                lstArsiv.Items.Add(item.ToplamHasilat + "TL");

            }
        }
    }
}
