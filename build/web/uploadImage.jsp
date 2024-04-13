<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Image Upload</title>
    <style>
        body {
    font-family: Arial, sans-serif; /* Use whatever font you prefer */
}

h2 {
    text-align: center;
}

form {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
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

    </style>
</head>
<body>
    <h2>Upload Image</h2>
    <form method="post" action="UploadImageServlet" enctype="multipart/form-data">
        Select Image: <input type="file" name="imageFile"><br><br>
        <input type="submit" value="Upload">
    </form>
</body>
</html>
