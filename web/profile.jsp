<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page session="true"%>

<%
String u_name =(String) session.getAttribute("u_name");
String email = (String) session.getAttribute("email");

String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/mysql";
String userid = "root";
String password = "";

Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;
%>

<html lang="en">

<head>
    <meta charset="UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

    <style>
        body {
            margin: 0;
            font-family: 'Caveat', sans-serif;
        }

        .main {
            background-color: #ffffff54;
            width: 400px;
            height: 600px;
            margin: 30px;
            border-radius: 1.5em;
            box-shadow: 0px 11px 35px 10px rgba(0, 0, 0, 0.14);
            left: 0px;
        }
        .main2 {
        padding-left: 20px;
         padding-right: 20px;
        background-color: #ffffff54; 
        font-family: gotham;
        margin: 10px 0 30px 190px; /* Adjust the left margin to push it away from the overlapping element */
        border-radius: 1.5em;
        /*box-shadow: 0px 11px 35px 10px rgba(0, 0, 0, 0.14);*/
    }
        .myBox {
            border: none;
            padding: 5px;
            font: 24px/36px sans-serif;
            width: 200px;
            height: 200px;
            overflow: scroll;
            
            margin-left:   60px;
            }

        .sign {
            padding-top: 40px;
            color: #b03527;
            font-family: 'Ubuntu', sans-serif;
            font-weight: bold;
            font-size: 23px;
        }

        .un {
            width: 76%;
            color: rgb(0, 0, 0);
            font-weight: 700;
            font-size: 18px;
            letter-spacing: 1px;
            background: rgb(255, 255, 255);
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            outline: none;
            box-sizing: border-box;
            border: 2px solid rgba(0, 0, 0, 0.02);
            margin-bottom: 50px;
            margin-left: 46px;
            text-align: center;
            margin-bottom: 27px;
            font-family: 'Ubuntu', sans-serif;
        }

        form.form1 {
            padding-top: 40px;
        }
        input::file-selector-button {
          font-weight: bold;
          color: black;
          padding: 0.5em;
          background-color: white;
          border:2px solid #4C934C;
          border-radius: 3px;
        }

        .un:focus,
        .pass:focus {
            border: 2px solid rgba(0, 0, 0, 0.18) !important;
        }

        .submit {
            cursor: pointer;
            border-radius: 5em;
            color: #fff;
            background:#4C934C;
            border: 0;
            padding-left: 40px;
            padding-right: 40px;
            padding-bottom: 10px;
            padding-top: 10px;
            font-family: 'Ubuntu', sans-serif;
            margin-left: 35%;
            font-size: 13px;
            box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
        }
         .Upload {
            cursor: pointer;
            border-radius: 5em;
            color: #fff;
            background:#4C934C;
            border: 0;
            text-decoration: none;
            padding-left: 40px;
            padding-right: 40px;
            padding-bottom: 10px;
            padding-top: 10px;
            font-family: 'Ubuntu', sans-serif;
/*            margin-left: 35%;*/
            font-size: 13px;
            box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
        }

        .forgot {
            text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
            color: #b03527;
            padding-top: 15px;
        }

     
        button {
            margin: 5px;
            align-items: center;
        }

        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        
    </style>
   <style>
    table {
        width: 100%;
        border-collapse: collapse;
    }

    th {
        padding: 60px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        background-color: #f2f2f2;
    }

    td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        vertical-align: top;
    }

    tr:hover {
        background-color: #f5f5f5;
    }
.edit {
  background-color: #04AA6D; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
.delete {
  background-color: #f44336; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
}
</style>





 
</head>

<body background="images\profile_circle.svg">
      <div class="header">
          <a href="home.jsp" style="text-decoration: none;">Nature Navigator</a>
        <div class="nav">
            <a href="home.jsp">Home</a>
            <a href="mountain_details.jsp">Location</a>
            <a href="aboutus.jsp">About Us</a>
            <a href="picture.jsp">Pictures</a>
            <a href="profile.jsp"><img src="images/profile_circle.svg" alt="Profile Icon" class="profile-icon"></a>
        </div>
    </div>
   <div class="main">
    <div style="display: flex;">
        <!-- Profile Section -->
        <div style="flex: 1; padding: 40px;">
            <div class="un" align="center">
                <img style="width: 140px; height: 100px; border-radius: 9999px" src="images/profileimage.PNG" /><br><br>
                <label style="font-family: gotham; color: #010101;">USERNAME : </label><span style="color: #000000; font-size: 16px; font-family: gotham; font-weight: 700; word-wrap: break-word"><%= u_name %><br />
</span>
<br>
                EMAIL : 
               <span style="color: #000000; font-size: 16px; font-family: gotham; font-weight: 700; word-wrap: break-word">
    <%= email %><br />
</span>

            </div>
            <div class="income" align="center">
<!--                <input id="avatar" type="file" name="avatar" accept="image/png, image/jpeg" style="color: transparent;">-->
            </div>
            <div align="center" style="width: 76%; color: rgb(250, 250, 250); font-weight: 700;">Your Groups</div>
            <form action="LogoutServlet" method="get">
    <button type="submit" class="submit">Logout</button>
</form>
            <br>
             <%
    if ("admin".equals(u_name) && "admin@gmail.com".equals(email)) {
    %>
    <!-- Display the button only if the user is admin -->
    <div align="center">
        <a href="admin_upload.jsp" class="Upload" >Admin Upload</a>
    </div>
    <% } %>

        </div>
            
        <!-- Reviews Section -->
    <div class="main2">
            <div class="un" align="center">
    Your Reviews
</div>
<table border="1">
    <tr>
        <td>mountain</td>
        <td>rating</td>
        <td>review</td>
         <%
if (!u_name.equals("admin")) {
%>
        <td>Edit</td>
        <td>Delete</td>
        <%
}
%>
    </tr>
    <% 
    try {
        Class.forName(driver);
        connection = DriverManager.getConnection(connectionUrl, userid, password);
        
        String sql;
        if (u_name.equals("admin")) {
            // If the user is admin, fetch all reviews
            sql = "SELECT * FROM reviews";
        } else {
            // Otherwise, fetch reviews for the specific user
            sql = "SELECT * FROM reviews WHERE u_name=?";
        }
        
        preparedStatement = connection.prepareStatement(sql);
        
        if (!u_name.equals("admin")) {
            preparedStatement.setString(1, u_name);
        }
        
        resultSet = preparedStatement.executeQuery();
        
        while(resultSet.next()) {
    %>
    <tr>
        <td><%=resultSet.getString("mountain") %></td>
        <td><%=resultSet.getString("rating") %></td>
        <td><%=resultSet.getString("review") %></td>
        <%
if (!u_name.equals("admin")) {
%>
<td><a class="edit" href="edit_review.jsp?mountain=<%=resultSet.getString("mountain") %>&rating=<%=resultSet.getString("rating") %>&review=<%=resultSet.getString("review") %>">Edit</a></td>
<td><a class="delete" href="delete_review.jsp?mountain=<%=resultSet.getString("mountain") %>&rating=<%=resultSet.getString("rating") %>&review=<%=resultSet.getString("review") %>">Delete</a></td>
<%
}
%>
</tr>

    <% 
        } 
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
</table>
</div>
</div>
</div>
</div>

</div>

</body>

</html>
