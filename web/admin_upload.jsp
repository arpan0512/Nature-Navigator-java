<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Upload</title>
     <style>
        body {
    font-family: Arial, sans-serif;
     align-items:  center;/* Use whatever font you prefer */
}

h2 {
    text-align: center;
}

form {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    align-items: center;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="file"] {
    display: block;
    margin-bottom: 10px;
}

input[type="submit"] {
    background-color: #4CAF50; /* Green background color */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #45a049; /* Darker green on hover */
}

a{
    margin-left: 50px;
     background-color: #4CAF50; /* Green background color */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    cursor: pointer;
    transition: background-color 0.3s;
}
a:hover {
    background-color: red; /* Darker green on hover */
}


    </style>
</head>
<body>
    <h1>Admin Upload</h1>
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
    <script>
        alert("<%= message %>");
    </script>
    <%
        }
    %>
   <form action="AdminUploadServlet" method="post" enctype="multipart/form-data">

         Select Image: <input type="file" name="imageFile"><br><br>
        <label for="mountainName">Mountain Name:</label><br>
        <input type="text" id="mountainName" name="mountainName"><br>
        <label for="distance">Distance (km):</label><br>
        <input type="number" id="distance" name="distance" step="0.1"><br>
        <label for="averageTime">Average Time (hours):</label><br>
        <input type="number" id="averageTime" name="averageTime" step="0.01"><br>
        <label for="averagePace">Average Speed (k/h):</label><br>
        <input type="number" id="averagePace" name="averagePace" step="0.01"><br>
        <label for="weatherCondition">Weather Condition:</label><br>
        <input type="text" id="weatherCondition" name="weatherCondition"><br><br>
        <input type="submit" value="Submit">  
         <a href="profile.jsp">Back</a>
    </form>
   
</body>
</html>
