<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Document</title>
    <script src="index.js" defer></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const form = document.forms.myform;

            form.addEventListener("submit", function (event) {
                // Prevent the form from submitting if validation fails
                if (!validateForm()) {
                    event.preventDefault();
                }
            });

            function validateForm() {
                const u_name = form.u_name.value.trim();
                const email = form.email.value.trim();
                const password = form.password.value.trim();

                // Validate username
                if (u_name === "") {
                    alert("Please enter a username.");
                    return false;
                }

                // Validate email
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    alert("Please enter a valid email address.");
                    return false;
                }

                // Validate password
                if (password === "") {
                    alert("Please enter a password.");
                    return false;
                }

                return true; // All validations passed
            }
        });
    </script>
</head>
<body>
<%
    if (request.getParameter("submit") != null) {
        String u_name = request.getParameter("u_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "");
            pst = con.prepareStatement("insert into registor(u_name, email, password) values(?, ?, ?)");
            pst.setString(1, u_name);
            pst.setString(2, email);
            pst.setString(3, password);
            pst.executeUpdate();

            out.println("<script>alert('Record Added');</script>");

            // Optionally, redirect to another page after successful insertion
            // response.sendRedirect("success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
        }
    }
%>
<form name="myform" action="Reg" method="post">
    <div class="container">
        <div class="imgcontainer">
            <img class="hiking" src="images/HIking 5.png" alt="hiking">
        </div>
        <div class="Rform">
            <ul>
                <li><h1>Create Account</h1></li>
                <li>
                    <input class="inpfeed" type="text" id="u_name" name="u_name" placeholder="Username">
                </li>
                <li>
                    <input class="inpfeed" type="email" id="email" name="email" placeholder="Email">
                </li>
                <li>
                    <input class="inpfeed" type="password" id="password" name="password" placeholder="Password">
                </li>
                <li>
                    <button class="inpfeed" id="btn" type="submit" name="submit" value="Submit">Sign up</button>
                </li>
                <li>
                    <p class="login">Already have an account? <a href="login.jsp" class="loginLink">Sign in</a></p>
                </li>
            </ul>
        </div>
    </div>
</form>
</body>
</html>
