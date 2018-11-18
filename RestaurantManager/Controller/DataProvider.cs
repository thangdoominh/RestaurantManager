using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RestaurantManager.Controller
{
    public class DataProvider
    {
        private static DataProvider instance;
        public static DataProvider Instance
        {
            get
            {
                if (instance == null)
                    instance = new DataProvider();
                return DataProvider.instance;
            }
            private set
            {
                DataProvider.instance = value;
            }

        }

        private DataProvider() { }
        private string connectionSTR = @"Data Source=.\SQLEXPRESS;Initial Catalog=QuanLyNhaHang;Integrated Security=True";

        

        public DataTable ExcuteQuery(string query, object[] parameter = null)
        {
            DataTable data = new DataTable();

            //ket noi tu client xuong server
            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();

                //cau truy van thuc thi
                SqlCommand command = new SqlCommand(query, connection);
                if (parameter != null)
                {
                    string[] lisPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in lisPara)
                    {
                        if (item.Contains('@'))
                        {
                            //command.Parameters.Clear();
                            command.Parameters.AddWithValue(item, parameter[i]);
                            //command.ExecuteNonQuery();    
                            i++;
                        }
                    }
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);

                //Đỗ dữ liệu lấy ra vào data
                adapter.Fill(data); 

                connection.Close();
            }
            return data;
        }

        public int ExcuteNonQuery(string query, object[] parameter = null)
        {
            int  data = 0;

            //ket noi tu client xuong server
            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();

                //cau truy van thuc thi
                SqlCommand command = new SqlCommand(query, connection);
                if (parameter != null)
                {
                    string[] lisPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in lisPara)
                    {
                        if (item.Contains('@'))
                        {
                            //command.Parameters.Clear();
                            command.Parameters.AddWithValue(item, parameter[i]);
                            //command.ExecuteNonQuery();    
                            i++;
                        }
                    }
                }

                data = command.ExecuteNonQuery();

                connection.Close();
            }
            return data;
        }


        public object ExcuteScalar(string query, object[] parameter = null)
        {
            object data = 0;

            //ket noi tu client xuong server
            using (SqlConnection connection = new SqlConnection(connectionSTR))
            {
                connection.Open();

                //cau truy van thuc thi
                SqlCommand command = new SqlCommand(query, connection);
                if (parameter != null)
                {
                    string[] lisPara = query.Split(' ');
                    int i = 0;
                    foreach (string item in lisPara)
                    {
                        if (item.Contains('@'))
                        {
                            //command.Parameters.Clear();
                            command.Parameters.AddWithValue(item, parameter[i]);
                            //command.ExecuteNonQuery();    
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();

                connection.Close();
            }
            return data;
        }
  
    }
}
