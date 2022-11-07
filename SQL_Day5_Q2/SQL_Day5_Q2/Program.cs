using System.Data.SqlClient;

namespace SQL_Day5_Q2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            try
            {
                string ConnectionString = "Data Source=INLPF3KG6BL\\SQLEXPRESS;initial catalog=Day5;trusted_connection=true";
                SqlConnection sqlCon = new SqlConnection(ConnectionString);
                sqlCon.Open();

                Console.WriteLine("Enter The Account Balance");
                long balance = Convert.ToInt64(Console.ReadLine());


                string query = @"select Acc_no,cus_name,balance,Account_Details.cus_Aadhar_no,Acc_opened_date,Last_transaction_date from Account_Details INNER JOIN cus_Information   ON Account_Details.cus_Aadhar_no = cus_Information.cus_Aadhar_no  WHERE Account_Details.balance>@bal";

                SqlCommand cmd = new SqlCommand(query, sqlCon);

                cmd.Parameters.Add("@bal", System.Data.SqlDbType.BigInt).Value = balance;

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Console.Write(reader[0] + "  ");
                    Console.Write(reader[1] + "  ");
                    Console.Write(reader[2] + "  ");
                    Console.Write(reader[3] + "  ");
                    Console.Write(reader[4] + "  ");
                    Console.Write(reader[5] + "  ");

                    Console.WriteLine();
                }
                Console.WriteLine("successfully executed!!");
                reader.Close();
                sqlCon.Close();
                Console.ReadKey();
            }
            catch (SqlException exp)
            {
                Console.WriteLine(exp.Message);
                Console.WriteLine("Sql database related problem");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Console.WriteLine("General C# code related problem");
            }
        }
    }
}
