
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String log=(String)session.getAttribute("login");
    if(log == null){
        %>
        <script language="javascript">
           
   alert("Please Login ");
       window.location.replace("index.jsp");
    </script>
    <%
    }     

%>
<<html>
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
    <form action="transfer.jsp">

<table style="width:100%; background:#FFFFFF; margin:0;">
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
    
    <td  width="75%" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="welcome" ><h1>Welcome</h1><br>
    	    <%
                   String acc_no=(String)session.getAttribute("acc_no");



try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/bank","root","");  
String val;
Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from users where acc_no ='"+acc_no+"' ");  
while(rs.next()) 
{    
session.setAttribute("name", rs.getString("name"));
%>

<table>
<tr><td>Name :</td><td><%=rs.getString("name") %></td></tr>
<tr><td>Account Number :</td><td><%=rs.getString("acc_no") %></td></tr>
<tr><td>Balance :</td><td>Rs. <%=rs.getInt("balance") %></td></tr>
<tr><td></td><td></td><td><input  type="Submit" value="Fund Transfer"></td></tr>
</table>
<%
}
con.close();  

}catch(Exception e){System.out.println(e);}
                   
                   %>
	    	
	    </div>      
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