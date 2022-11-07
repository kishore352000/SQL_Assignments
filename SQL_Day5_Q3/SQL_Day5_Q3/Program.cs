
    using System.Data.SqlClient;

namespace SQL_Day5_Q3
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

                Console.WriteLine("Enter The Choice");
                string choice = Console.ReadLine();

                string query = @"select Horror_movies,Kids_movies from Movies ";
                SqlCommand cmd = new SqlCommand(query, sqlCon);

                SqlDataReader reader = cmd.ExecuteReader();
                int i = 0;

                while (reader.Read())
                {
                    if (i == 5) break;

                    switch (choice)
                    {
                        case "horror":
                            {

                                Console.Write(reader[0]);

                            }
                            break;
                        case "kids":
                            {

                                Console.WriteLine(reader[1]);
                            }
                            break;
                    }
                    i++;
                    Console.WriteLine();
                }
                reader.Close();
                sqlCon.Close();
            }
            catch (SqlException Sqe)
            {
                Console.WriteLine(Sqe.Message);
                Console.WriteLine("Sql Related problem");
            }
            catch (Exception exp)
            {
                Console.WriteLine(exp.Message);
                Console.WriteLine("C-Sharp code related problem");
            }
        }
    }

}
