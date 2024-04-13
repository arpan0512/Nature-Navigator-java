<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Review</title>
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
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }

    .stars input[type="radio"] {
        display: none;
    }

    .stars label {
        cursor: pointer;
        font-size: 30px;
    }

    .stars label:before {
        content: "\2605";
    }

    .stars input[type="radio"]:checked ~ label:before {
        color: gold;
    }
</style>
</head>
<body>
    <h1>Edit Review</h1>
    <form action="update_review.jsp" method="post">
        <!-- Display mountain name as non-editable -->
        <label for="mountain">Mountain Name:</label><br>
        <input type="text" id="mountain" name="mountain" value="<%= request.getParameter("mountain") %>" readonly><br>
        <!-- Allow user to edit rating -->
        <label for="rating">Rating:</label><br>
        <div class="stars">
            <input type="radio" id="star5" name="rating" value="5" <%= request.getParameter("rating").equals("5") ? "checked" : "" %>><label for="star5"></label>
            <input type="radio" id="star4" name="rating" value="4" <%= request.getParameter("rating").equals("4") ? "checked" : "" %>><label for="star4"></label>
            <input type="radio" id="star3" name="rating" value="3" <%= request.getParameter("rating").equals("3") ? "checked" : "" %>><label for="star3"></label>
            <input type="radio" id="star2" name="rating" value="2" <%= request.getParameter("rating").equals("2") ? "checked" : "" %>><label for="star2"></label>
            <input type="radio" id="star1" name="rating" value="1" <%= request.getParameter("rating").equals("1") ? "checked" : "" %>><label for="star1"></label>
        </div><br>    
        <!-- Allow user to edit review -->
        <label for="review">Review:</label><br>
        <textarea id="review" name="review" rows="4" cols="50"><%= request.getParameter("review") %></textarea><br><br>
        <input type="submit" class="submit" value="Update Review">
    </form>
</body>
</html>
