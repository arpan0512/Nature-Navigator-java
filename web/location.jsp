<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="style.css">
    <title>Nature Navigator</title>
    <!-- Add your CSS stylesheets here -->
   <style>
    body {
        margin: 0;
        font-family: 'Caveat', cursive;
    }

</style>
<style>

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
            
            margin-bottom: 27px;
            font-family: 'Ubuntu', sans-serif;
        }
          .main2 {
        padding-left: 90px;
        background-color: #ffffff54;            
        width: 500px;
        height: 500px;
        margin: 10px 0 30px 90px; /* Adjust the left margin to push it away from the overlapping element */
        border-radius: 1.5em;
        box-shadow: 0px 11px 25px 15px rgba(0, 0, 0, 0.14);
    }
      .table {
        padding-left: 100px;
        background-color: #ffffff54;            
        width: 800px;
        height: 600px;
        margin: 10px 0 30px 90px; /* Adjust the left margin to push it away from the overlapping element */
        border-radius: 1.5em;
        box-shadow: 0px 11px 45px 15px rgba(0, 0, 0, 0.14);
    }
      .main3 {
        padding-left: 50px;
        background-color: #ffffff54; 
        font-family: gotham;
        color: #4C934C;     
        margin: 10px 0 30px 40px; /* Adjust the left margin to push it away from the overlapping element */
        border-radius: 1.5em;
        
    }
ul {
  list-style-type: circle;
  text-align: left;
}
li{
    text-align: left;
}
ul li{
    text-align: left;
}
</style>

<style>
    .search-container {
    margin-right: auto;
    padding-right: 20px;/* Pushes the search container to the left */
}
.search-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.search-container button:hover {
  background: #ccc;
}
    </style>
    
    <style>
   .rating {
  display: inline-block;
}

.rating input {
  display: none;
}

.rating label {
  cursor: pointer;
  width: 25px;
  height: 25px;
  margin: 0;
  padding: 0;
  font-size: 30px;
  line-height: 30px;
  text-align: center;
  color: #4C934C;
  border-radius: 1.5em;
  border: 4px solid #000; /* Set initial border color to black */
}

.rating label:before {
  content: '\2605'; /* Unicode for star symbol */
}

.rating input:checked ~ label {
  color: #4C934C; /* Set the color to green when checked */
  border-color: #4C934C; /* Set the border color to green when checked */
}

.rating label:hover {
  color: #4C934C; /* Set the color to green on hover */
  border-color: #4C934C; /* Set the border color to green on hover */
}


    </style>
   <style>
    .review {
        float: none; /* Remove float */
        width: 100%; /* Adjust width to fit within column */
        padding: 10px;
        box-sizing: border-box;
        border: 2px solid #4C934C;
        border-radius: 10px;
        margin-bottom: 20px;
    }
    .column {
        float: left;
        width: 33.33%; /* Adjust column width for three columns */
        padding: 0 15px; /* Add some spacing between columns */
        box-sizing: border-box;
    }
    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }
    p {
        color: #4C934C;
    }
</style>

    <script>
        function setRating(value) {
  document.getElementById('ratingValue').value = value;
}

    </script>
  <style>
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
/*            margin-left: 5%;*/
            font-size: 13px;
            box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
        }

    .stars {
        unicode-bidi: bidi-override;
        color: #4C934C;
        font-size: 30px;
    }
    .stars > input[type="radio"] {
        display: none;
    }
    .stars > label {
        cursor: pointer;
    }
    .stars > label:before {
        content: "\2605";
    }
    .stars > input[type="radio"]:checked ~ label:before {
        color: gold;
    }
</style>

<style>
    .search{
        padding-right: 150px;
    }
    .searchinput{
        padding: 7px 3px;
    }
    .b {
   /* Green */
  border: none;
  color: white;
  padding: 6px 3px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}
    .b4 {
        font-family: gotham black;
  background-color: #4C934C;
  color: white;
  border: 2px solid #e7e7e7;
}

.b4:hover {background-color: #e7e7e7; color: #4C934C;}
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
    
            <!-- Display selected mountain details -->
         <div class="un">
        <%
            // Retrieve mountain name from request parameter
            String mountainName = request.getParameter("mountain");
            try {
                // JDBC connection to the database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
                // SQL query to retrieve mountain details based on name
                String sql = "SELECT * FROM mountains WHERE mountain_name=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, mountainName);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    // Retrieve mountain details from the result set
                    String mountainNameDB = rs.getString("mountain_name");
                    double distance = rs.getDouble("distance");
                    double averageTime = rs.getDouble("average_time");
                    double averagePace = rs.getDouble("average_pace");
                    String weatherCondition = rs.getString("weather_condition");
                    // Retrieve image blob from the result set
                    Blob imageBlob = rs.getBlob("image");
                    byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                    String imageUrl = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imageBytes);
                    // Display mountain image
        %>
                    <!-- Display mountain image on the left side -->
                    <div style="float: left; margin-right: 200px; padding-top: 30px">
                        <img src="<%= imageUrl %>" alt="<%= mountainNameDB %>" style="width: 700px; height: auto;">
                    </div>
                    <div style="padding-left: 650px">
                        <div style="flex: 1; padding: 10px;" class="main2">
                            <div style="overflow: hidden;">
                                <!-- Display mountain details -->
                                <br>
                                <label style="font-family: gotham; color: #4C934C;">Mountain : <b style="color: black;"><%= mountainNameDB %></b></label>
                                <br>
                                <label style="font-family: gotham; color: #4C934C;">Distance : <b style="color: black;"><%= distance %> miles</b></label>
                                <br>
                                <label style="font-family: gotham; color: #4C934C;">Average Time : <b style="color: black;"><%= averageTime %> hours</b></label>
                                <br>
                                <label style="font-family: gotham; color: #4C934C;">Average Pace :<b style="color: black;"> <%= averagePace %> mph</b></label>
                                <br>
                                <label style="font-family: gotham; color: #4C934C;">Weather Condition :<b style="color: black;"> <%= weatherCondition %></b></label>
                                <br>
                                <br>
                                <label style="font-family: gotham; color: #4C934C;">Basic Things : </label>
                                <span style="color: #000000; font-size: 16px; font-family: gotham; font-weight: 700; word-wrap: break-word">
                                    <!-- Basic Things content -->
                                </span>
                                <br>
                                <div style="text-align:left; color: #4C934C">
                                    <ul>
                                        <li>Water</li>
                                        <li>Snacks</li>
                                        <li>First Aid Kit</li>
                                        <li>Backpack</li>
                                        <li>Weather-Appropriate Clothing</li>
                                        <li>Sturdy Footwear</li>
                                        <li>Multi-Tool</li>
                                        <li>Flashlight or Headlamp</li>
                                        <li>Emergency Whistle</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Add review form -->
                    <div style="padding-left: 50px">
                        <div style="flex: 1; padding: 10px;" class="main3">
                            <h2>Add Review</h2><br>
                            <form action="AddReviewServlet" method="post">
                                <!-- Hidden input field to store mountain name -->
                                <input type="hidden" id="mountain" name="mountain" value="<%= mountainNameDB %>">
                                <label for="rating">Rating:</label><br>
                                <!-- Rating stars input -->
                                <div class="stars">
                                    <input type="radio" id="star1" name="rating" value="1"><label for="star1"></label>
                                    <input type="radio" id="star2" name="rating" value="2"><label for="star2"></label>
                                    <input type="radio" id="star3" name="rating" value="3"><label for="star3"></label>
                                    <input type="radio" id="star4" name="rating" value="4"><label for="star4"></label>
                                    <input type="radio" id="star5" name="rating" value="5"><label for="star5"></label>
                                </div><br>             
                                <label for="review">Review:</label><br>
                                <!-- Review text area -->
                                <textarea id="review" name="review" rows="4" cols="50"></textarea><br><br>
                                <!-- Submit button -->
                                <input class="submit" type="submit" value="Submit">
                            </form>

                            <br>
                            <!-- Reviews Grid -->
                            <h2>Reviews Grid</h2>
                            <div class="clearfix">
                                <% 
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
                                        String sql2 = "SELECT * FROM reviews WHERE mountain=?";
                                        PreparedStatement stmt2 = conn.prepareStatement(sql2);
                                        stmt2.setString(1, mountainNameDB);
                                        ResultSet rs2 = stmt2.executeQuery();
                                        int count = 0; // Counter to keep track of reviews
                                        out.println("<div class='column'>"); // Start the first column
                                        while (rs2.next()) {
                                            if (count % 3 == 0 && count != 0) {
                                                // Close the previous column and start a new one for every 3rd review
                                                out.println("</div><div class='column'>");
                                            }

                                            int rating = rs2.getInt("rating");
                                            String review = rs2.getString("review");
                                            String userName = rs2.getString("u_name"); // Retrieve u_name from ResultSet

                                            out.println("<div class='review'>");
                                            out.print("<h2>User: " + userName + "</h2><br>");
                                            out.print("<h3>" + mountainNameDB + "</h3>");
                                            out.print("<p>Rating: \u2605 " + rating + "/5 </p>");             // Include u_name in the output
                                            out.println("<p>" + review + "</p>");
                                            out.println("</div>");

                                            count++;
                                        }
                                        out.println("</div>"); // Close the last column
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        // Close JDBC resources
                                        // Same as before
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                            <%
               } else {                   
        %>
                    <p>No data found for the selected mountain.</p>
        <%
                }
                // Close JDBC resources
                // Same as before
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </div>  
</body>
</html>