
<%@ page language="java" import="twitter.ApiMain"
	contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!
	String keyWord = ""; 
	String type = "";
	%>

	<% keyWord = request.getParameter("key_word");%>
	<% type = request.getParameter("Search_Type");%>

	<h3>
		Search result by 
		<br/>
		key word: <%=keyWord %>
		<br/>
		type: <%= type%>
	</h3>

	<%! ApiMain api = new ApiMain(); %>
	<% api.application_only_auth(); %>
	<%=ApiMain.apiSearch(keyWord,type) %>

</body>
</html>


