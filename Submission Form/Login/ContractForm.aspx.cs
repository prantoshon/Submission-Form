using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace Login
{
    public partial class ContractForm : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection("Data Source=DESKTOP-HM3JBK0\\SQLEXPRESS;Initial Catalog=PPL;Integrated Security=True");
        string Pin;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DivsisonDropDownload();
            }

            //string strValue = Request.QueryString("SelectedCellValue").ToString()
            txtDepartment.Text = Session["deptName"].ToString();
            txtName.Text = Session["Name"].ToString();
            txtPermernentAddress.Text = Session["permanentAddress"].ToString();
            Pin = Session["pin"].ToString();
            //Session.Remove("deptName");
            //Session.Remove("Name");
            //Session.Remove("permanentAddress");

            txtwriteDetails.Enabled = false;
            txtDate.Enabled = false;

            LoadData();

            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[4] {
            new DataColumn("Divsion"), new DataColumn("Zilla"),new DataColumn("Thana"),new DataColumn("Zone")
        });
                ViewState["Info"] = dt;
                this.BindGrid();
            }

        }
        protected void BindGrid()
        {
            dgvData.DataSource = (DataTable)ViewState["Info"];
            dgvData.DataBind();
        }
        private void LoadData()
        {
            con.Open();
            string qry = "SELECT     * FROM CoronaInfo  WHERE        (Dept = N'" + txtDepartment.Text + "') AND (pin = N'" + Pin + "')";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            // string dept = 
            if (sdr.Read())
            {

                txtAddress.Text = (sdr["PresentAddress"].ToString());
                drpHouseType.SelectedItem.Text = (sdr["HouseType"].ToString());

                //string radio = (sdr["Coronasymptom"].ToString());
                //if (radio.Trim() =="1")
                //{
                //    rbtnCoronaInfo.Items[1].Selected = true;
                //}
                // if (radio =="0")
                //{
                //    rbtnCoronaInfo.Items[0].Selected = true;
                //}
                //else
                //{
                //    rbtnCoronaInfo.Items[1].Selected = false;
                //    rbtnCoronaInfo.Items[0].Selected = false;
                //}

                //Session["deptName"] = (sdr["Name"].ToString());
                //Session["pin"] = (sdr["PIN"].ToString());
                //Session["Name"] = (sdr["Name_of_Employee"].ToString());
                //Session["permanentAddress"] = (sdr["Permanent_Address"].ToString());
                //Server.Transfer("ContractForm.aspx");


            }
            else
            {

                //LblMessage.Text = "Login Fail......!!";

            }
            con.Close();
        }
        protected void btnExit_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            Session.Clear();
            Response.Cookies.Clear();
            Response.Redirect("Defualt.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            StringBuilder sbUserChoices = new StringBuilder();
            if (chkWaking.Checked)
            {
                sbUserChoices.Append(chkWaking.Text);
            }
            if (chkBus.Checked)
            {
                sbUserChoices.Append("  " + chkBus.Text);
            }
            if (chkBike.Checked)
            {
                sbUserChoices.Append("  " + chkBike.Text);
            }

            if (cheOfficeCar.Checked)
            {
                sbUserChoices.Append("  " + cheOfficeCar.Text);
            }
            if (chkCng.Checked)
            {
                sbUserChoices.Append("  " + chkCng.Text);
            }

            if (rbtnCoronaInfo.Text == "No")
            {
                txtwriteDetails.Text = String.Empty;
                txtDate.Text = String.Empty;
            }

            using (SqlCommand command = con.CreateCommand())
            {
                command.CommandText = "INSERT INTO  dbo.CoronaInfo (Dept, Name, HouseType,WaytoComeOffice,Coronasymptom,CoronasymptomDetails,pin,PresentAddress,comment1,Date) VALUES (@Dept, @Name,@HouseType,@WaytoComeOffice,@Coronasymptom,@CoronasymptomDetails,@pin,@PresentAddress,@comment1,@Date)";

                command.Parameters.AddWithValue("@Dept", txtDepartment.Text.Trim());
                command.Parameters.AddWithValue("@Name", txtName.Text);
                command.Parameters.AddWithValue("@HouseType", drpHouseType.SelectedItem.Text);
                command.Parameters.AddWithValue("@WaytoComeOffice", sbUserChoices.ToString());
                command.Parameters.AddWithValue("@Coronasymptom", rbtnCoronaInfo.SelectedValue.Trim());
                command.Parameters.AddWithValue("@CoronasymptomDetails", txtwriteDetails.Text);
                command.Parameters.AddWithValue("@pin", Pin);
                command.Parameters.AddWithValue("@PresentAddress", txtAddress.Text);
                command.Parameters.AddWithValue("@comment1", txtCommnet1.Text);

                command.Parameters.AddWithValue("@Date", txtDate.Text);




                con.Open();
                int i = command.ExecuteNonQuery();
                if (i > 0)
                {

                    Response.Write("<script>alert('Save Successfully');</script>");



                }
                con.Close();

            }
        }
        private void DivsisonDropDownload()
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT [Marketing Division Name] as Name, [Marketing Division Code] as Code FROM            mkt.Division", con);
            SqlDataReader rdr = cmd.ExecuteReader();

            // DropDownList2.Items.Add("--SELECT Please --");
            drpDivsion.DataTextField = "Name";
            drpDivsion.DataValueField = "Code";
            drpDivsion.DataSource = rdr;
            drpDivsion.DataBind();
            drpDivsion.Items.Insert(0, new ListItem("SELECT Divsion", "0"));
            con.Close();


        }

        private void Zilla(string field)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-HM3JBK0\\SQLEXPRESS;Initial Catalog=PPL;Integrated Security=True");
            try
            {
                con.Open();
                string sqlStatement = "SELECT        mkt.Division.[Marketing Division Name], geo.[Zilla ].Name, geo.[Zilla ].Code FROM mkt.Division INNER JOIN geo.[Zilla] ON mkt.Division.[Marketing Division Name] = geo.[Zilla].Division WHERE(mkt.Division.[Marketing Division Name] = @Value1)";
                SqlCommand sqlCmd = new SqlCommand(sqlStatement, con);
                sqlCmd.Parameters.AddWithValue("@Value1", field);
                SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
                sqlDa.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    drpZilla.DataSource = dt;
                    drpZilla.DataTextField = "Name"; // the items to be displayed in the list items
                    drpZilla.DataValueField = "Code"; // the id of the items displayed

                    drpZilla.DataBind();
                    drpZilla.Items.Insert(0, new ListItem("SELECT Zilla", "0"));
                }
                else
                {
                    drpZilla.Items.Insert(0, new ListItem("Data not Founded", "0"));
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                con.Close();
            }

        }
        private void Thana(string field)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-HM3JBK0\\SQLEXPRESS;Initial Catalog=PPL;Integrated Security=True");
            try
            {
                con.Open();
                string sqlStatement = "SELECT        geo.[Zilla ].Name AS [zila name], geo.Thana.Name AS thananame, geo.[Zilla ].Code AS [zila code], geo.Thana.Code AS thanacode FROM geo.[Zilla]  INNER JOIN  geo.Thana ON geo.[Zilla].Code = geo.Thana.ZillaCode  WHERE(geo.[Zilla].Name = @Value1)";
                SqlCommand sqlCmd = new SqlCommand(sqlStatement, con);
                sqlCmd.Parameters.AddWithValue("@Value1", field);
                SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
                sqlDa.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    drpThana.DataSource = dt;
                    drpThana.DataTextField = "thananame"; // the items to be displayed in the list items
                    drpThana.DataValueField = "thanacode"; // the id of the items displayed

                    drpThana.DataBind();
                    drpThana.Items.Insert(0, new ListItem("SELECT Thana", "0"));
                }
                else
                {
                    drpThana.Items.Insert(0, new ListItem("Data not Founded", "0"));
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                con.Close();
            }

        }
        private void Zone(string field)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection("Data Source=DESKTOP-HM3JBK0\\SQLEXPRESS;Initial Catalog=PPL;Integrated Security=True");
            try
            {
                con.Open();
                string sqlStatement = "SELECT        geo.Thana.Name AS thananame, geo.Thana.Code AS [thana code], mkt.Zone.[Zone Name] as zname, mkt.Zone.[Zone Code] as zcode FROM geo.Thana INNER JOIN  mkt.Zone ON geo.Thana.ZoneCode = mkt.Zone.[Zone Code]  WHERE(geo.Thana.Name = @Value1)";
                SqlCommand sqlCmd = new SqlCommand(sqlStatement, con);
                sqlCmd.Parameters.AddWithValue("@Value1", field);
                SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
                sqlDa.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    drpZone.DataSource = dt;
                    drpZone.DataTextField = "zname"; // the items to be displayed in the list items
                    drpZone.DataValueField = "zcode"; // the id of the items displayed

                    drpZone.DataBind();
                    drpZone.Items.Insert(0, new ListItem("SELECT Zone", "0"));
                }
                else
                {
                    drpZone.Items.Insert(0, new ListItem("Data not Founded", "0"));
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg = "Fetch Error:";
                msg += ex.Message;
                throw new Exception(msg);
            }
            finally
            {
                con.Close();
            }

        }
        protected void drpDivsion_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpZilla.Items.Clear();
            drpThana.Items.Clear();
            drpZone.Items.Clear();
            Zilla(drpDivsion.SelectedItem.Text);
        }

        protected void drpZilla_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpThana.Items.Clear();
            drpZone.Items.Clear();
            Thana(drpZilla.SelectedItem.Text);
        }

        protected void drpThana_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpZone.Items.Clear();
            Zone(drpThana.SelectedItem.Text);

        }

        protected void drpZone_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Info"];
            dt.Rows.Add(drpDivsion.SelectedItem.Text, drpZilla.SelectedItem.Text, drpThana.SelectedItem.Text, drpZone.SelectedItem.Text);
            ViewState["Info"] = dt;
            this.BindGrid();
            //txtName.Text = "";
            //txtADDRESS.Text = "";
            //txtRoll.Text = "";
        }

        protected void dgvData_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            
        }

        protected void dgvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           

        }
    }
}