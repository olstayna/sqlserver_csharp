using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace minhaconexaobd
{
    class Program
    {
        static void Main(string[] args)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-DG7K8BS\SQLEXPRESS;integrated security=SSPI;initial catalog=db_hotel;");
            // Criar conexão
            con.Open();

            /* string strUp = "update tbl_Cliente set nm_cli = 'Fábio Toledo', nm_cidade = 'Indaiatuba' where cd_cli = 1";
            SqlCommand cmdUp = new SqlCommand(strUp, con);
            cmdUp.ExecuteNonQuery(); */

            /* string strDel = "delete from tbl_Cliente where cd_cli = 11";
            SqlCommand cmdDel = new SqlCommand(strDel, con);
            cmdDel.ExecuteNonQuery(); */


            Console.WriteLine("Informe o nome do cliente: ");
            string vNome = Console.ReadLine();

            Console.WriteLine("Informe o sexo do cliente: ");
            string vSexo = Console.ReadLine();

            Console.WriteLine("Informe o CPF do cliente: ");
            string vCPF = Console.ReadLine();

            Console.WriteLine("Informe a cidade do cliente: ");
            string vCidade = Console.ReadLine();

            string strIns = string.Format("insert into tbl_Cliente(nm_cli, sg_sexo, no_cpf, nm_cidade)values('{0}','{1}','{2}','{3}')",vNome,vSexo,vCPF,vCidade);
            SqlCommand cmdIns = new SqlCommand(strIns, con);
            cmdIns.ExecuteNonQuery();

            string strConsulta = "select * from tbl_Cliente";
            SqlCommand cmd = new SqlCommand(strConsulta, con);
            SqlDataReader dados = cmd.ExecuteReader();

            while (dados.Read()) //enquanto existir dados
            {
                Console.WriteLine("Código:{0},Nome:{1},Sexo:{2},CPF:{3},Cidade:{4}",dados["cd_cli"], dados["nm_cli"], dados["sg_sexo"], dados["no_cpf"], dados["nm_cidade"]);
                Console.WriteLine("");
            }
        }
    }
}
