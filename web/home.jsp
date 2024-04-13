<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/2d6a32a5ff.js" crossorigin="anonymous"></script>
    <title>Nature Navigator</title>
    <style>
        body {
            margin: 0;
            font-family: 'Caveat', cursive;
        }
    </style>
    <script>
    window.onload = function() {
        const slides = document.querySelectorAll('.slide');
        let currentSlide = 0;

        function nextSlide() {
            slides[currentSlide].classList.remove('active');
            currentSlide = (currentSlide + 1) % slides.length;
            slides[currentSlide].classList.add('active');
        }

        setInterval(nextSlide, 2000); // Change slide every 5 seconds
    };
</script>
    <style>
        * {box-sizing:border-box}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Hide the images by default */
.mySlides {
    display: none;
}

/* Show the first slide by default */
.mySlides:first-child {
    display: block;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
        </style>
        <script>
  var slideIndex = 1;
  showSlides(slideIndex);

  function plusSlides(n) {
    showSlides(slideIndex += n);
  }

  function currentSlide(n) {
    showSlides(slideIndex = n);
  }

  function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " active";
    
  }
</script>

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
   <div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <div class="numbertext">1 / 5</div>
    <img src="images/HIking 1.png" style="width:100%">
    <div class="text">Caption Text</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">2 / 5</div>
    <img src="images/HIking 2.png" style="width:100%">
    <div class="text">Caption Two</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">3 / 5</div>
    <img src="images/HIking 5.png" style="width:100%">
    <div class="text">Caption Three</div>
  </div>
   <div class="mySlides fade">
    <div class="numbertext">4 / 5</div>
    <img src="images/Hiking 3.png" style="width:100%">
    <div class="text">Caption Three</div>
  </div>
   <div class="mySlides fade">
    <div class="numbertext">5 / 5</div>
    <img src="images/Hiking 4.png" style="width:100%">
    <div class="text">Caption Three</div>
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
  <span class="dot" onclick="currentSlide(4)"></span>
  <span class="dot" onclick="currentSlide(5)"></span>
</div>

    <div class="content">
        <div class="features">
            <div class="feature">
                <img class="icon" src="images/icon/maplocation.svg">
                <div style="color: #4C934C; font-size: 30px; font-family: Gotham Black; font-weight: 500;">Live Location</div>
            </div>
            <div class="feature">
                <img class="icon" src="images/icon/mapdownload.svg">
                <div style="color: #4C934C; font-size: 30px; font-family: Gotham Black; font-weight: 500;">Downloadable Maps</div>
            </div>
            <div class="feature">
                <img class="icon" src="images/icon/weather.svg">
                <div style="color: #4C934C; font-size: 30px; font-family: Gotham Black; font-weight: 500;">Weather Reports</div>
            </div>
            <div class="feature">
                <img class="icon" src="images/icon/rating.svg">
                <div style="color: #4C934C; font-size: 30px; font-family: Gotham Black; font-weight: 500;">Ratings & Reviews</div>
            </div>
        </div>

        <form name="myform" action="home.jsp" method="post">
            <div class="container">
                <div class="imgcontainer">
                    <img class="hiking" src="images/HIking 5.png" alt="hiking" style="width: 100%; height: auto;">
                </div>
                <div class="Rform">
                    <form action="ContactUsServlet" method="post">
                    <ul>
                        <li><h1>Contact Us</h1></li>
<!--                        <li>
                            <input class="inpfeed" type="text" id="uname" name="uname" placeholder="Username">
                        </li>
                        <li>
                            <input class="inpfeed" type="email" id="email" name="email" placeholder="Email">
                        </li>-->
                        <li>
                            <textarea class="inpfeed" type="area" id="msg" name="msg" placeholder="Enter Message"></textarea>
                        </li>
                        <li>
                            <button class="inpfeed" id="btn" type="submit" name="submit" value="Submit">Submit</button>
                        </li>
                    </ul>
                    </form>
                </div>
            </div>
        </form>
<!--        <a href="test.jsp">test</a>-->
    </div>    
</body>
</html>
