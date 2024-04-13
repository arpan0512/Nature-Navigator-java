<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
     <link rel="stylesheet" href="style.css">
    <title>Image Gallery</title>
    <style>
        .image {
            float: left;
            width: 100%;
            padding: 5px;
        }
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
        }
        .imagelink {
    text-align: center;
    padding-top: 20px;
}

.imagelink a {
    display: inline-block;
    padding: 10px 20px ; /* Adjust padding as needed */
    background-color: #4CAF50; /* Green background color */
    color: white;
    text-decoration: none;
    border: 2px solid #4CAF50; /* Green border */
    border-radius: 5px; /* Rounded corners */
    transition: background-color 0.3s, color 0.3s, border-color 0.3s;
}

.imagelink a:hover {
    background-color: #45a049; /* Darker green on hover */
    border-color: #45a049; /* Darker green border on hover */
}

       
    </style>
</head>
<body>
    
     <div class="header">
        <a href="home.jsp">Nature Navigator</a>
        <div class="nav">
            <a href="home.jsp">Home</a>
            <a href="mountain_details.jsp">Location</a>
            <a href="aboutus.jsp">About Us</a>
            <a href="picture.jsp">Pictures</a>
            <a href="profile.jsp"><img src="images/profile_circle.svg" alt="Profile Icon" class="profile-icon"></a>
        </div>
    </div>
    <div class="imagelink">
    <a href="uploadImage.jsp">Upload Images </a>   
    </div>
  
    
    <h2>Uploaded Image</h2>
    <div class="clearfix">
      <% 
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
        String sql = "SELECT * FROM images";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();
        int count = 0;
        while (rs.next()) {
            count++;
            String name = rs.getString("name");
            Blob blob = rs.getBlob("image");
            byte[] imageBytes = blob.getBytes(1, (int) blob.length());
            String base64Image = new String(java.util.Base64.getEncoder().encode(imageBytes), "UTF-8");
            if (count % 2 == 1) {
                out.println("<div class='clearfix'>");
            }
            out.println("<div class='image'>");
            out.println("<img src='data:image/jpeg;base64," + base64Image + "' width='600' height='600'>"); // Adjusted dimensions
            out.println("<p>" + name + "</p>");
            out.println("</div>");
            if (count % 5 == 0) {
                out.println("</div>");
            }
        }
        if (count % 2 != 0) {
            out.println("</div>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

    </div>
   
</body>
</html>
