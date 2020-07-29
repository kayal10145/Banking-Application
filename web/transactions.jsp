<%-- 
    Document   : transactions
    Created on : 29-Jul-2020, 15:07:57
    Author     : Halith
--%>


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
else{

}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ABC Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>


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

<table style="width:100%; background:#FFFFFF; margin:0;">
    <tr align="justify">
	<td width="25%" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		    <ul>
        	<li><a href="#">Online Banking</a></li>
            <li><a href="#">Loans </a></li>
            <li><a href="#">Deposits</a></li>
            </ul>
			
       </div>
	</td>
    
    <td  width="75%" valign="top" style="border-right:#666666 1px dotted;">
        <div id="welcome" ><h1>Welcome :<%=session.getAttribute("name") %></h1>
    	   
		    <h1>Transactions</h1>
                    <table style="width:100%;" >
                        <tr><td>Sender</td><td>Receiver</td><td>Action</td><td>Amount</td><td>Date</td></tr>
                   <%
                   String acc_no=(String)session.getAttribute("acc_no");



try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/bank","root","");  
String val;
Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select * from transactions where sender ='"+acc_no+"' or receiver='"+acc_no+"' order by id desc limit 5");  
while(rs.next()) 
{
    String sen= Integer.toString(rs.getInt("sender"));
    
if(sen.equals(acc_no)){
    val="Send";
}else{
    val="Received";
}
%>
<tr><td><%=rs.getInt("sender") %></td><td><%=rs.getInt("receiver") %></td><td><%= val %></td><td><%=rs.getInt("amount") %></td><td nowrap="nowrap"><%=rs.getString("date") %></td></tr>
<%
}
con.close();  

}catch(Exception e){System.out.println(e);}
                   
                   %>
                    
                    
                    
                    </table>
	    	
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
