<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
    
    
    <!DOCTYPE html>
<html>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>first name</td>
</tr>
<% 
String driver = "com.mysql.jdbc.Driver";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try{
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/?user=abarna/", "abarna", "abarna");
	Statement st=conn.createStatement();
	st.executeQuery("use bank_application");

	String query=("select Recipient from user where Debited_amt='5000' ");
 resultSet =st.executeQuery(query);
while(resultSet.next()){
%>
<tr><td>Name</td><td><input type="text" name="name" value="<%=resultSet.getString("name")%>"></td></tr>
	
<%	 }
}catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</table>
</body>
</html>