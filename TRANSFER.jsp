<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
    

<%
String Recipient=request.getParameter("Recipient");
String Amount=request.getParameter("Amount");
String driver = "com.mysql.jdbc.Driver";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

try
{
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/?user=abarna/", "abarna", " ");
Statement st=conn.createStatement();
st.executeQuery("use bank_application");

st.executeUpdate("Update user set Balance=Balance-'"+Amount+"' ");
int i=st.executeUpdate("insert into user(Recipient, Debited_amt, Transaction_time)values('"+Recipient+"', '"+Amount+"', CURRENT_TIMESTAMP())");
out.println("Done!!!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
