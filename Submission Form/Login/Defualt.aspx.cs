using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Login
{
    public partial class Defualt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-HM3JBK0\\SQLEXPRESS;Initial Catalog=PPL;Integrated Security=True");
        protected void btnSingIn_Click(object sender, EventArgs e)
        {
            try
            {
                string employeeID = txtEmloyeeID.Text;
                string phoneNumber = txtMobileNumber.Text;
                con.Open();
                string qry = "SELECT        hrd.Employee.Name_of_Employee, hrd.Employee.PIN, hrd.Employee.Permanent_Address, hrd.Employee.Mobile_No, hrd.Department.Name FROM hrd.Employee INNER JOIN hrd.Department ON hrd.Employee.Department_Code = hrd.Department.Code  WHERE(hrd.Employee.PIN = N'" + txtEmloyeeID.Text+"') AND(hrd.Employee.Mobile_No = N'"+txtMobileNumber.Text+"')";
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataReader sdr = cmd.ExecuteReader();
               // string dept = 
                if (sdr.Read())
                {
                    


                    Session["deptName"] = (sdr["Name"].ToString());
                    Session["pin"] = (sdr["PIN"].ToString());
                    Session["Name"] = (sdr["Name_of_Employee"].ToString());
                    Session["permanentAddress"] = (sdr["Permanent_Address"].ToString());
                    Server.Transfer("ContractForm.aspx");
                   

                }
                else
                {
                   
                    LblMessage.Text = "Login Fail......!!";

                }
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
    
}