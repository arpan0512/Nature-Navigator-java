function validateForm() {
    var uname = document.forms["myform"]["uname"].value;
    var mail = document.forms["myform"]["mail"].value;
    var pass = document.forms["myform"]["pass"].value;

    if (uname === "") {
        alert("Name must be filled out");
        return false;
    }

    if (mail === "") {
        alert("Email must be filled out");
        return false;
    }

    if (pass === "") {
        alert("Password must be filled out");
        return false;
    }

    if (pass.length < 8) {
        alert("Password must be at least 8 characters long");
        return false;
    }

    if (!/[A-Z]/.test(pass)) {
        alert("Password must contain at least one uppercase letter");
        return false;
    }

    // If all validations pass, return true
    return true;
}
