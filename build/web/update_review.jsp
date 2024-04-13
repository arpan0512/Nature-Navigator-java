<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Review</title>
</head>
<body>
    <h1>Update Review</h1>
    <%
        String mountain = request.getParameter("mountain");
        String rating = request.getParameter("rating");
        String review = request.getParameter("review");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String driver = "com.mysql.cj.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/mysql";
        String userid = "root";
        String password = "";

        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(connectionUrl, userid, password);
            String sql = "UPDATE reviews SET rating=?, review=? WHERE mountain=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, rating);
            preparedStatement.setString(2, review);
            preparedStatement.setString(3, mountain);
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                // Redirect to profile.jsp after successful update
                response.sendRedirect("profile.jsp");
            } else {
                out.println("<p>Failed to update review.</p>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
