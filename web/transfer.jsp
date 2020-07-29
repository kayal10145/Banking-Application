
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
public String check(String accno,String amount,String rec, String date){
String val="no";
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/bank","root","");  

Statement stmt=con.createStatement();  

ResultSet rs=stmt.executeQuery("insert into transactions(sender,receiver,amount,date) values('"+accno+"','"+rec+"','"+amount+"','"+date+"')");  
ResultSet rs2=stmt.executeQuery("select balance from users where acc_no ='"+accno+"' ");  
int bal = rs2.getInt("balance");
int am=Integer.parseInt(amount);
bal=bal-am;
String balance=Integer.toString(bal);
ResultSet rs3=stmt.executeQuery("update users set balance= '"+balance+"'where acc_no ='"+accno+"' ");  
con.close();  

}catch(Exception e){System.out.println(e);}
return "yes";
}

%>

<%
    String log=(String)session.getAttribute("login");
    if(log == null){
        %>
        <script language="javascript">
           
   alert("Please Login ");
       window.location.replace("index.jsp");
    </script>
    <%
    }else{

 String acc_no=(String)session.getAttribute("acc_no");
String rec=request.getParameter("rec");
String amount=request.getParameter("amount");
String date="2020-07-29";
if(rec!=null){
    String res=check(acc_no, amount, rec,date);
  %>
        <script language="javascript">
           
   alert("Transaction Successfull....");
        window.location.replace("balance.jsp");</script>
    <%
}   }  

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
    	<div id="welcome" ><h1>Welcome</h1><br>
    	  

<table>
    <tr><td nowrap="nowrap">Enter Account Number :</td><td><input type="text" required="true" name="rec"></td></tr>
 <tr><td nowrap="nowrap">Enter Amount to transfer :</td><td><input type="text" required="true" name="amount"></td></tr>
<tr><td></td><td></td><td><input  type="Submit" value="Transfer"></td></tr>
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
