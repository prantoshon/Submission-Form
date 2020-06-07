<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractForm.aspx.cs" Inherits="Login.ContractForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <a href="css/"></a><link href="css/pikaday.css" rel="stylesheet" />
    <link href="css/site.css" rel="stylesheet" />
    <link href="css/theme.css" rel="stylesheet" />
    <script src="pikaday.js"></script>
    <title>Corona Information</title>
        <link runat="server" rel="shortcut icon" href="PP.ico" type="image/x-icon"/>
    <style>
        /*base*/
.error_txt{margin-bottom: 10px; display: block; color: #f00; font-size: 13px;}
.inactive{display:none;}

/*foundation-example*/
#foundation-example{}
.foundation-example__ex-wrapper{
	background-color: lightblue;
}
.foundation-example__in-wrapper{  
	margin: auto;
    max-width: 960px;
    background: white;
    padding: 30px;
}

.foundation-example__title{  
	text-align: center;
    font-size: 40px;
    margin-bottom: 32px;
}

.foundation-example__form-wrapper{  

}



    </style>
      <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="css/foundation.css">
    <link rel="stylesheet" href="css/app.css">
    
        <script type="text/javascript">
            function redirect() {
               location.href = '<%= Page.ResolveUrl("~/Defualt.aspx") %>';
            }

            function validate() {
               
                
                   

                if (document.getElementById("txtAddress").value == "") {
                    alert("Please Provide Present Address...");
                    document.getElementById("txtAddress").focus();
                    return false;
                }
                if (document.getElementById("drpHouseType").value == "Select Please") {
                    alert("Please Select House Type");
                    document.getElementById("drpHouseType").focus();
                    return false;
                }
                if (
                  chkWaking.checked == false &&
                  chkBus.checked == false &&
                  chkBike.checked == false&&
                    cheOfficeCar.checked == false&&
                    chkCng.checked == false

                ) {
                    alert("Please Select At Least one way to come office");
              

                   return false;
                }
              

                
                var radio = document.getElementsByName("rbtnCoronaInfo"); //Client ID of the RadioButtonList1                            

                for (var i = 0; i < radio.length; i++) {
                    if (radio[i].checked) { // Checked property to check radio Button check or not  

                        // alert("Radio button having value " + radio[i].value + " was checked."); // Show the checked value  
                        if (radio[i].value == "Yes") {
                            //$("#txtwriteDetails").removeAttr("disabled");
                            
                            //txtwriteDetails.style.display = '';
                          //  return false;
                            
                        }
                        //else
                        //{
                        //    $("#txtwriteDetails").removeAttr("enabled");
                        //}
                        //$("#txtwriteDetails").prop("disabled", true);
                          if (confirm("Confirm Submit?")) {


                          //  alert("Successfully Submited");
                            return true;
                        }

                    }
                }

                alert("Please Select Corona Systom");      // if not checked any RadioButton from the RadioButtonList    
                return false;


               
                


               
            }

        

        </script>
    <script >

      function Toggle()
 {
     var radio = document.getElementsByName('<%=rbtnCoronaInfo.ClientID %>');
     var txt = document.getElementById('<%=txtwriteDetails.ClientID %>');
        for (var j = 0; j < radio.length; j++)
        {
           if (radio[j].checked)
           {
                if(radio[j].value == 'Yes')
                {
                    txt.style.display = '';
                    $("#txtwriteDetails").prop("disabled", false);
                    $("#txtDate").prop("disabled", false);
                    $("#txtwriteDetails").focus();
                   
                }
                else
                {
                    //txt.style.display = 'none';
                    $("#txtwriteDetails").prop("disabled", true)
                    $("#txtDate").prop("disabled", true);
                    document.getElementById("txtwriteDetails").value = "";
                    document.getElementById("txtDate").value = "";
                    
                }
            }
        }
 }
    </script>
  

</head>
<body>
    <form id="form1" runat="server">
    <div>
      	<section id="foundation-example">
  		<div style="height: 50px;background: lightblue;"></div>
  		<div class="foundation-example__ex-wrapper">
  			<div class="foundation-example__in-wrapper">
	  			<div class="foundation-example__title"> Corona Information</div>
	  			<div class="foundation-example__form-wrapper">
				  

						<div class="row">
							<div class="large-6 columns">
								<label>Department
                                   
              <asp:TextBox ID="txtDepartment" runat="server" ReadOnly="True"></asp:TextBox>
								  <%--  <input type="text" name="product_id">--%>
								     <div class="error_txt inactive" id="error_pro_id">Please provide your Product ID.</div> 
								</label>
							</div>

							<div class="large-6 columns">
								<label>Name
                                    <asp:TextBox ID="txtName" runat="server" ReadOnly="True"></asp:TextBox>
							  <%--   <input type="text" name="per_in_chg" >--%>
							      <div class="error_txt inactive" id="error_per_in_chg">Please provide your Person In Charge.</div> 
							    </label>
							</div>
						</div>


						<div class="row">
							<div class="large-6 columns">
								<label>Permanent Address
							     <asp:TextBox ID="txtPermernentAddress" runat="server" ReadOnly="True"></asp:TextBox>
							      <div class="error_txt inactive" id="error_name">Please provide your name.</div> 
							    </label>

							    <label>House Type
                                   
                                <asp:DropDownList ID="drpHouseType" runat="server">
                                    <asp:ListItem>Select Please</asp:ListItem>
                                    <asp:ListItem>Apartment</asp:ListItem>
                                    <asp:ListItem>Flat</asp:ListItem>
                                    <asp:ListItem>Single Room</asp:ListItem>
                                </asp:DropDownList>
							  <%--    <input type="text" name="email" >--%>
							       <div class="error_txt inactive" id="error_email">Please provide your email.</div> 
							    </label>

							    <label>Ways of Come to Office <br>
                                   
                                    <asp:CheckBox ID="chkWaking" runat="server" Text="Walking" />
                                    <asp:CheckBox ID="chkBus" runat="server" Text="Bus" />
                                    <asp:CheckBox ID="chkBike" runat="server" Text="Bike" />
                                    <asp:CheckBox ID="cheOfficeCar" runat="server" Text="Office Car" /><br>
                                     <asp:CheckBox ID="chkCng" runat="server" Text="CNG" />
							   <%--  <input type="text" name="phone" class="numeric allownumericwithoutdecimal">--%>
							      <div class="error_txt inactive" id="error_phone">Please provide your phone.</div> 
							    </label>
							</div>

							<div class="large-6 columns">
								<label>Present Address
                                    <asp:TextBox ID="txtAddress" runat="server" ></asp:TextBox>
							  <%--   <textarea rows="10"  name="address" ></textarea>--%>
							      <div class="error_txt inactive" id="error_address">Please provide your address.</div> 
							    </label>

            

							</div>

                              
						


						<div class="row">
							<div class="large-12 columns">
								<label>Details
                                    <table border="1" width="39%">
            <tr>
                <td width="20%">
                  Infortant Information
                </td>
                <td width="33%">
                   Deatils
                </td>
                <td width="34%">
                   Comments
                </td>
                  
            </tr>
            <tr>
                <td width="20%">
                   1May to 15May
                </td>
                <td width="33%">
                   
                      <asp:TextBox ID="txtDetails1" runat="server" TextMode="MultiLine" ></asp:TextBox>
<%--                    Row2,Col2--%>
                </td>
                <td width="34%">
               <asp:TextBox ID="txtCommnet1" runat="server" TextMode="MultiLine" ></asp:TextBox>
                </td>
                
            </tr>
              <tr>
                <td width="20%">
                   15May to 31May
                </td>
                <td width="33%">
                   <asp:TextBox ID="txtDetails2" runat="server" TextMode="MultiLine" ></asp:TextBox>
                </td>
                <td width="34%">
                 <asp:TextBox ID="txtCommnet2" runat="server" TextMode="MultiLine" ></asp:TextBox>
                </td>
             
            </tr>
        </table>
                              

								<label>Any Symtom of Corona??
                              <%--      <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>--%>
                                    <asp:RadioButtonList ID="rbtnCoronaInfo" runat="server" onclick="Toggle()">
                                        <asp:ListItem >Yes</asp:ListItem>
                                        <asp:ListItem  >No</asp:ListItem>
                                </asp:RadioButtonList>
                                     </label>
				  <asp:TextBox ID="txtwriteDetails" runat="server" ></asp:TextBox>
<div class="row">
	<div class="large-6 columns">
             <label>Date
                                   
          <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
        <script type="text/javascript">
            var picker = new Pikaday(
            {
                field: document.getElementById('txtDate'),
                firstDay:1,
                minDate: new Date('2000-01-01'),
                maxDate: new Date('2025-01-01'),
                yearRange: [2000, 2025],
                numberOfMonths: 1,
               
            });
        </script>             
	</label>
		</div>
    </div>
 <asp:ScriptManager ID="ScriptManager1" runat="server" />

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate>
	<div class="row">
	<div class="large-6 columns">
             <label>Divsion
                 <asp:DropDownList ID="drpDivsion" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpDivsion_SelectedIndexChanged" ></asp:DropDownList>
                     
	</label>
        <label>Zilla
                                  
						 <asp:DropDownList ID="drpZilla" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpZilla_SelectedIndexChanged" ></asp:DropDownList>
							    </label>
          <label>Thana
                                  
						 <asp:DropDownList ID="drpThana" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpThana_SelectedIndexChanged" ></asp:DropDownList>
							    </label>
        <label>Zone
                                  
						 <asp:DropDownList ID="drpZone" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpZone_SelectedIndexChanged" ></asp:DropDownList>
							    </label>
		</div>
    </div>	

         <asp:GridView ID="dgvData" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSelectedIndexChanged="dgvData_SelectedIndexChanged">
             
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
           
        </asp:GridView>
          </ContentTemplate>
   <Triggers>
      <asp:AsyncPostbackTrigger ControlID="drpDivsion" EventName="SelectedIndexChanged" />
       <asp:AsyncPostbackTrigger ControlID="drpZilla" EventName="SelectedIndexChanged" />
         <asp:AsyncPostbackTrigger ControlID="drpThana" EventName="SelectedIndexChanged" />
        <asp:AsyncPostbackTrigger ControlID="drpZone" EventName="SelectedIndexChanged" />
   </Triggers>
</asp:UpdatePanel>
         <%--                           <div class="row">					  
	<div class="large-6 columns">
								<label>Zilla
                                  
						 <asp:DropDownList ID="drpZilla" runat="server" ></asp:DropDownList>
							    </label>

            </div>

							</div>	--%>				

						 
							   
						       <asp:Button ID="btnSubmit" class="success button"  runat="server" Text="Submit" OnClientClick="return validate()" OnClick="btnSubmit_Click" />   
                              <asp:Button ID="btnExit" class="alert button" runat="server" Text="Exit" OnClick="btnExit_Click" OnClientClick="redirect(); return false;" />   
                                    </div>
                                   

                                 
							
						


					
						
					
	  			</div>
  			</div>
  		</div>
  <%--		<div style="height: 50px;background: lightblue;"></div>--%>
  	</section>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/vendor/jquery.js"></script>
    <script src="js/vendor/what-input.js"></script>
    <script src="js/vendor/foundation.js"></script>
    <script src="js/app.js"></script>
    </div>
    </form>
</body>

    <link href="//cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/js/foundation.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</html>
