<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/mysql";
String userid = "root";
String password = "";
try {
    Class.forName(driver);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}
Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;
%>
<%
    String u_name =(String) session.getAttribute("u_name") ;     
%>
<!DOCTYPE html>
<html>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>mountain</td>
<td>rating</td>
<td>review</td>
</tr>
<%
try{
    connection = DriverManager.getConnection(connectionUrl, userid, password);
    String sql ="SELECT * FROM reviews WHERE u_name=?";
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, u_name);
    resultSet = preparedStatement.executeQuery();
    while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("mountain") %></td>
<td><%=resultSet.getString("rating") %></td>
<td><%=resultSet.getString("review") %></td>
</tr>
<%
    }
    connection.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>
</table> 

</body>
</html>
