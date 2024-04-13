<!DOCTYPE html>
<html>
<head>
       <script src="index.js" defer></script>
       <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
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
                const username = form.uname.value.trim();
                const email = form.email.value.trim();
                const password = form.password.value.trim();

                // Validate username
                if (username === "") {
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
    <title>Login Page</title>
</head>
<body>
    
<!--    <form action="LoginServlet" method="post">
        <label for="email">Email:</label><br>
        <input type="text" id="email" name="email"><br>
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password"><br><br>
        <input type="submit" value="Login">
    </form>-->
    <form name="myform" action="LoginServlet" method="post">
    <div class="container">
        <div class="imgcontainer">
            <img class="hiking" src="images/HIking 5.png" alt="hiking">
        </div>
        <div class="Rform">
            <ul>
                <li><h1>Signin Account</h1></li>
              
                <li>
                    <input class="inpfeed" type="email" id="email" name="email" placeholder="Email">
                </li>
                <li>
                    <input class="inpfeed" type="password" id="password" name="password" placeholder="Password">
                </li>
                <li>
                    <button class="inpfeed" id="btn" type="submit" name="submit" value="Submit">Sign in</button>
                </li>
                <li>
                    <p class="login">Don't have an account? <a href="index.jsp" class="loginLink">Sign up</a></p>
                </li>
            </ul>
        </div>
    </div>
</form>
</body>
</html>
