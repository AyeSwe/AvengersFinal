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
<h2 align="center"><font><strong>Department Information</strong></font></h2>
<table>
<tr>

</tr>
<tr bgcolor="#000099">
<td><b>dept_no</b></td>
<td><b>dept_name</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM departments";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#87CEFA">

<td><%=resultSet.getString("dept_no") %></td>
<td><%=resultSet.getString("dept_name") %></td>


</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>