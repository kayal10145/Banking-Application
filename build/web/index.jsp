


<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%!
public String check(String accno,String pass){
String val="no";
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/bank","root","");  

Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from users where acc_no='"+accno+"' and password='"+pass+"'");  
while(rs.next()) 

val="yes";
con.close();  

}catch(Exception e){System.out.println(e);}
return val;
}

%>
<%
String acc_no=request.getParameter("acc_no");
String password=request.getParameter("password");
if(acc_no!=null){
    String res=check(acc_no,password);
    if(res.equals("yes")){
        session.setAttribute("acc_no", acc_no);
        session.setAttribute("login", "yes");
        response.sendRedirect("balance.jsp");
    }else{
        %>
        <script language="javascript">
            var s="<%=password%>"; 
   alert("Invalid Credentials....Try Again ");</script>
    <% }
}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ABC Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">


</head>

<body>

<div id="top_links">
  

<div id="header">
	<h1>ABC - BANK<span class="style1"></span></h1>
    

</div>

<div id="navigation">
    <ul>
    <li><a href="#">NEW ACCOUNT</a></li>
    <li><a href="balance.jsp">BALANCE</a></li>
    <li><a href="transfer.jsp">TRANSFER</a></li>
    <li><a href="transactions.jsp">TRANSACTIONS</a></li>
    <li><a href="#">ABOUT US</a></li>
    </ul>
</div>
    <form action="#">

<table style="width:897px; background:#FFFFFF; margin:0;">
    <tr align="justify">
	<td width="229" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		    <ul>
        	<li><a href="#">Online Banking</a></li>
            <li><a href="#">Loans </a></li>
            <li><a href="#">Deposits</a></li>
            </ul>
			
       </div>
	</td>
    
    <td  width="229" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="welcome" ><h1>Welcome</h1><br>
    	    <center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center><br>
		    <p>ABC Bank provides more reliable and efficient services to their users. Digitize your transactions with more secured banking network. We are happy to help you</p>
	    	
	    </div>      
    </td>
      <td  width="229" valign="top" >
      <div id="welcome" >   <table> 
              <th>Login</th>
              <tr>
                  <td>Acc Number</td><td><input type="text" name="acc_no" required="true"></td>
              </tr>
               <tr>
                   <td>Password</td><td><input type="password" name="password" required="true"></td>
              </tr>
           <tr>
                  <td></td><td><input type="submit" value="Login"></td>
              </tr>
          </table>  </div>
    </td>
  
</tr></table>
    </form>
<div id="footer_top">
  <div id="footer_navigation">
  

  </div>
  
  <div id="footer_copyright" >
 
    	    
	  
  Copyright © ABC BANK</div>
</div>

<script type="text/javascript">
document.onload = ctck();
</script>
</div>

</body>
</html>





