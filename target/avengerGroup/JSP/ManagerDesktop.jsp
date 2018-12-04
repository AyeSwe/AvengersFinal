<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel = "stylesheet" href ="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

nav ul {
    list-style-type: none;
    padding: 3;
}
.button:hover {background-color: #000099}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}


nav ul {
    list-style-type: none;
    padding: 3;
}

article {
    float: left;
    padding: 20px;
   /*  width: 70%; */
  
  
}

/* Clear floats after the columns */
section:after {
    content: "";
    display: table;
    clear: both;
}
header {
	
   /* background-color:white ; */
    padding: 20%;
    text-align: center;
    font-size: 35px;
    color: white;
    height: 90%;
 
   
} 

nav {
   
    width: 100%;
    height: 40px;
    background: #000099; 
    padding:40px;
    color: white;
    text-align: center;
    font-size: 20px;
    color: yellow;
} 
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #000099;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #3e8e41;
}


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
a{
	 background-color:  #000099;
	  color: white;
}
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<%
//String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://10.0.2.99/employees";
//String dbName = "employees";
String userId = "aye";
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
	
String sql2 = "SELECT employees.first_name, employees.last_name, employees.emp_no,employees.birth_date, employees.hire_date,salaries.salary FROM employees,Log_in, salaries WHERE employees.emp_no = (select employee_no From Log_in  WHERE User_name='"+user+"')";
resultSet = statement.executeQuery(sql2); 
%>

<%
if (resultSet.next()){

%>
<p>Manager Desktop</p>
<ul>
  <li><a class="active" href="../index.html">Home</a></li>
  <li><a href="#To-be-build">HR</a></li>
  <li><a href="../HTML/Employee_Login.html">Log out</a></li>
  <li> <a href="../Twitter/index_Twit.html"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
  <li> <a href="https://github.com/AyeSwe/AvengersFinal" target="_blank"><i class="fa fa-github" aria-hidden="true"></i></a></li>
		
</ul>




<tr>
<td align="center"><font><strong> Welcome</strong></font> </td>
<td align="center"><font><strong><%=resultSet.getString("first_name")%></strong></font></td>

<td align="center"><font><strong><%=resultSet.getString("last_name")%></strong></font><td>

</tr>
<p> Employee number: <%=resultSet.getInt("emp_no")%></p>
<p> Employee birthday: <%=resultSet.getDate("birth_date")%></p>
<p> Employee hired date: <%=resultSet.getDate("hire_date")%></p>
<p> Employee salary: <%=resultSet.getInt("salary")%></p>
<% } %>

<%   
}
  else{ %>
 
<a href= "../index.html">Wrong user name or password! Please Log in again</a>
<% }


}
catch(Exception e){
System.out.println(e);
}

%>




