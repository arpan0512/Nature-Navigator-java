<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Review</title>
</head>
<body>
    <h1>Delete Review</h1>
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
            String sql = "DELETE FROM reviews WHERE mountain=? AND rating=? AND review=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, mountain);
            preparedStatement.setString(2, rating);
            preparedStatement.setString(3, review);
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                // Redirect to profile.jsp after successful deletion
                response.sendRedirect("profile.jsp");
            } else {
                out.println("<p>Failed to delete review.</p>");
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
