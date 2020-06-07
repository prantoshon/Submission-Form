<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Defualt.aspx.cs" Inherits="Login.Defualt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<head runat="server">
    <title>Login</title>
    <link runat="server" rel="shortcut icon" href="PP.ico" type="image/x-icon"/>
    <style>
        .wrapper {    
	margin-top: 80px;
	margin-bottom: 20px;
}

.form-signin {
  max-width: 420px;
  padding: 30px 38px 66px;
  margin: 0 auto;
  background-color: #eee;
  border: 3px dotted rgba(0,0,0,0.1);  
  }

.form-signin-heading {
  text-align:center;
  margin-bottom: 30px;
}

.form-control {
  position: relative;
  font-size: 16px;
  height: auto;
  padding: 10px;
}

input[type="text"] {
  margin-bottom: 0px;
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

input[type="password"] {
  margin-bottom: 20px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

.colorgraph {
  height: 7px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
}

    </style>
    <script>
        function Validaion()
        {

         if (document.getElementById("txtEmloyeeID").value == "") {
             alert("Please enter your Employee ID");
            document.getElementById("txtEmloyeeID").focus();
            return false;
        }
       
         if (document.getElementById("txtMobileNumber").value == "")
        {
            alert("Please enter your mobile Number");
            document.getElementById("txtMobileNumber").focus();
            return false;
        }
      
      
       
        return true;
    }
    </script>

</head>
<body style="background-color: #C0C0C0">
    <form id="form1" runat="server" style="background-color: #C0C0C0">
    <div>
    <div class = "container">
	<div class="wrapper">
		      <div class="form-signin"">
		    <h2 class="form-signin-heading">Forms Submission</h2>
			  <hr class="colorgraph"><br>
			  
			  <%--<input type="text" class="form-control" name="Username" placeholder="Username" required="" autofocus="" />--%>
        <asp:TextBox ID="txtEmloyeeID" class="form-control" placeholder="Employee ID" runat="server"></asp:TextBox>
			  <%--<input type="password" class="form-control" name="Password" placeholder="Password" required=""/> --%>   
                  <asp:TextBox ID="txtMobileNumber" class="form-control" placeholder="Mobile Number"  runat="server"></asp:TextBox>  		  
			<%-- 
			  <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Login" type="Submit">Login</button>  --%>	
                  <asp:Button ID="btnSingIn" class="btn btn-lg btn-primary btn-block" OnClientClick="return Validaion()" runat="server" Text="Sign In" OnClick="btnSingIn_Click" />		
					<asp:Label ID="LblMessage" runat="server" ForeColor="Red"></asp:Label>
              </div>
	</div>
</div>
    </div>
    </form>
</body>
</html>
