<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<%
//String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost/employees";
//String dbName = "employees";
String userId = "root";
String password = "Enterprise007*";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>User Log in</strong></font></h2>

<%
try{ 
	String user=request.getParameter("user");
	String pass=request.getParameter("pass");
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql = "SELECT * FROM Log_in WHERE User_name='"+user+"' AND Password='"+pass+"'";
resultSet = statement.executeQuery(sql);
int count=0;
while(resultSet.next()){
count++;
}
if(count>0){
out.println("welcome "+user);
}
else{
response.sendRedirect("TestLogin.jsp");
}
}
catch(Exception e){
System.out.println(e);
}

%>




