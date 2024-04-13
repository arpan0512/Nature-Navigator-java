<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>All Mountains</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        thead {
            background-color: #4C934C;
            color: white;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        th {
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        img {
            max-width: 100px;
            max-height: 100px;
        }
        form {
    display: flex;
    align-items: center;
}

input[type="text"] {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-right: 5px;
}

input[type="submit"] {
    padding: 8px 15px;
    margin-right: 50px;
    background-color: white;
    color: #4C934C;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #4C934C;
    color: white;
}

    </style>
</head>
<body>
<div class="header">
    <a href="home.jsp">Nature Navigator</a>
    <div class="nav">
        <form style="align-items:center;" method="GET" action="mountain_search.jsp">
            <input type="text" name="search" placeholder="Search..">
            <input type="submit" value="submit">
        </form>
        <a href="home.jsp">Home</a>
        <a href="mountain_details.jsp">Location</a>
        <a href="aboutus.jsp">About Us</a>
        <a href="picture.jsp">Pictures</a>
        <a href="profile.jsp"><img src="images/profile_circle.svg" alt="Profile Icon" class="profile-icon"></a>
    </div>
</div>
<h1>All Mountains</h1>
<table border="1">
    <thead>
    <tr>
        <th>Mountain Name</th>
        <th>Distance (miles)</th>
        <th>Average Time (hours)</th>
        <th>Average Pace (mph)</th>
        <th>Weather Condition</th>
        <th>Image</th>
        <th>Details</th>
    </tr>
    </thead>
    <tbody>
    <% 
    String searchName = request.getParameter("search");
    try {
        // JDBC URL, username, and password
        String jdbcUrl = "jdbc:mysql://localhost:3306/mysql";
        String username = "root";
        String password = "";
        Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
        Statement stmt = conn.createStatement();
        String sql = "SELECT * FROM mountains";
        if (searchName != null && !searchName.isEmpty()) {
            sql += " WHERE mountain_name LIKE '%" + searchName + "%'";
        }
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            String mountainName = rs.getString("mountain_name");
            double distance = rs.getDouble("distance");
            double averageTime = rs.getDouble("average_time");
            double averagePace = rs.getDouble("average_pace");
            String weatherCondition = rs.getString("weather_condition");
            // Assuming the image is stored as a BLOB in the database
            Blob imageBlob = rs.getBlob("image");
            byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
            String imageUrl = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imageBytes);
    %>
            <tr>
                <td><%= mountainName %></td>
                <td><%= distance %></td>
                <td><%= averageTime %></td>
                <td><%= averagePace %></td>
                <td><%= weatherCondition %></td>
                <td><img src="<%= imageUrl %>" alt="<%= mountainName %>" style="width: 100px; height: 100px;"></td>
                <td><a href="location.jsp?mountain=<%= mountainName %>">View Details</a></td>
            </tr>
    <% 
        }
        rs.close();
        stmt.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    %>
    </tbody>
</table>
</body>
</html>
