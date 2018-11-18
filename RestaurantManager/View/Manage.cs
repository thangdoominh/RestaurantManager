using RestaurantManager.Controller;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RestaurantManager.View
{
    public partial class Manage : Form
    {
        public Manage()
        {
            InitializeComponent();
            loadAccountList();
        }


        void loadAccountList()
        {
            //string query = "SELECT UserName as [Tài khoản], PassWord as [Mật khẩu], DisPlayName as [Họ và tên], Birth as [Ngày sinh], Phone as [SĐT], Type FROM dbo.Account";
            string query = "SELECT * FROM Account";
            //DataProvider provider = new DataProvider();

            dtgvStaff.DataSource = DataProvider.Instance.ExcuteQuery(query);
        }
    }
}
