<%-- 
    Document   : Home
    Created on : 13 Oct, 2023, 7:54:08 PM
    Author     : Personal
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="netflizpckg.Conn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>Homepage</title>
        <link rel="stylesheet" href="Homecss.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!--SWIPER--->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/10.3.1/swiper-bundle.css">
  <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
         
if(session.getAttribute("email")==null)
{
     response.sendRedirect("signin.html");
}

     %>
         <style>
            /* CSS for labels */
            
    .popup, .popup1,.popup2,.popup3,.popup4,.popup5,.popup6,.popup7 {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        padding: 20px;
        background-color: #E12901;
        
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        border-radius: 8px;
        z-index: 1;
        text-align: center;
        font-family: Arial, sans-serif;
        max-width: 300px;
        border: 2px solid black;
    }

    .popup p, .popup1 p,.popup2 p,.popup3 p,.popup4 p,.popup5 p,.popup6 p,.popup7 p{
        font-size: 18px;
        color: white;
        margin: 10px 0;
    }

    .close, .close1,.close2,.close3,.close4,.close5,.close6,.close7 {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 24px;
        color: #333;
        cursor: pointer;
    }

    /* Style the close button on hover */
    .close,.close1,.close2,.close3,.close4,.close5,.close6,.close7:hover {
        color: #ff0000;
    }
  
            label {

                width: 50px; /* Adjust the width as needed */
                font-weight: bold;
                margin-left:55px;
                justify-content: center;
            }

            /* CSS for text inputs */
            .search-text {
                width: 200px; /* Adjust the width as needed */
                padding: 5px;
                margin: 5px;
                margin-left: 20px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .heart-button {
                border: none; /* Remove borders */
                background: none; /* Remove background */
                padding: 0; /* Remove padding */
                cursor: pointer; /* Change cursor to pointer on hover */
            }

            .heart-button i {
                color: white; /* Default color */
            }

            .heart-button:hover i {
                color: red; /* Change color of <i> on hover */
            }
        </style>

    </head>
    <body>
        <form id="myForm" method="post">

            <div class="sidebar">
                <div class="logo-details">

                    <div class="logo_name">
                        <h3>Netflix</h3>
                    </div>
                    <i class='bx bx-menu' id="btn" ></i>
                </div>
                <ul class="nav-list">
                    <li>
                        <i class='bx bx-search' ></i>
                        <input type="text" placeholder="Search...">
                        <span class="tooltip">Search</span>
                    </li>
                    <li>
                        <a href="HomeInsert.jsp">
                            <i class='bx bx-grid-alt'></i>
                            <span class="links_name"  onclick="openCity(event, 'dashboard')">Dashboard</span>
                        </a>
                        <span class="tooltip">
                            <button>Dashboard</button>
                        </span>
                    </li>
                    <li>
                        <a href="#user">
                            <i class='bx bx-user' ></i>
                            <span class="links_name" onclick="openCity(event, 'user')">
                                <button>User</button> 
                            </span>
                        </a>
                        <span class="tooltip">User</span>
                    </li>
                    <li>
                        <a href="#favouritemovie_section">
                            <i class='bx bx-heart' ></i>
                            <span class="links_name" onclick="openCity(event, 'favorite-movies')">
                                <button>Favourite Movies</button>
                            </span>
                        </a>
                        <span class="tooltip">Favourite Movies</span>
                    </li>
                    <li>
                        <a href="HomeSearch.jsp#search-section">
                            <i class='bx bx-file' ></i>
                            <span class="links_name" onclick="openCity(event, 'search-movies')">
                                <button>Search Movies</button>
                            </span>
                        </a>
                        <span class="tooltip">Search Movies</span>
                    </li>
  <li class="profile">
                      
                      
                            <a href="logout.jsp">
                            <i class='bx bx-log-out' id="log_out" ></i>
                            
                             </a>
                            <span class="tooltip">Logout</span>
                   
 
                    </li>
                </ul>
            </div>



            <section class="home-section">




                <!-- Tab Content -->
                <div class="tabcontent" id="dashboard">
                    <!---BANNER---->
                    <div class="banner">
                        <div class="banner_contents">
                            <h1 class="banner_title">Money Heist</h1>
                            <div class="banner_buttons">
                                <button class="banner_button">Play</button>
                                <button class="banner_button">My List</button> 
                            </div>
                            <div class="banner_description">
                                To carry out the biggest heist in history, a mysterious man called
                                The Professor recruits a band of eight robbers who have a single
                                characteristic:n...
                            </div>
                        </div>
                        <div class="banner__fadebottom"></div>
                    </div>



                    <div class="sidebar">
                        <!-- Sidebar content as you provided -->
                    </div>

                    <h2>Netflix Originals</h2>
                    <!--slider---->
                    <section id="main-slider">

                        <!-- Swiper -->
                        <div class="swiper mySwiper">
                            <div class="swiper-wrapper">

                                <!---1------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                            <button value="insert" class="heart-button" name="action" onclick="submitFormAndInsert()" type="submit">
                                                <i class="fa-solid fa-heart" aria-hidden="true"></i>
                                            </button>
                                        </a>


                                         <!--img--->
                                        <div class="main-slider-img">
                                            <img src="stranger.jpg" alt="Poster"/>
                                        </div>

                                        <!--text---->
                                        <div class="main-slider-text">
                                            <!--quality--> 
                                            <span class="quality">Full HD</span>

                                            <!--bottom text-->
                                            <div class="bottom-text">
                                                <!--name-->
                                                <div class="movie-name">
                                                    <span class="yeraPa">2021</span>
                                                    <strong class="titlePa">Stranger Things</strong>
                                                    <h4 style="color:red;">Sci/Fi</h4>
                                                </div>       
                                            </div>
                                            
                                             
                                         <div id="popup-container" class="popup">
    <span class="close" onclick="closePopup()">&times;</span>
    <p>Movie Added to Favorites Successfully</p>
</div>
                                         
                                            <%

if (request.getMethod().equals("POST")) {
    String action = request.getParameter("action");

    if ("insert".equals(action)) {
         
        try {
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/netflix");
            PreparedStatement insertPs = con.prepareStatement("INSERT INTO favourite (title, yera,img,genre) VALUES (?, ?, ?,?)");
           String imagePath = "stranger.jpg";
            // Inserting static values directly into the query
            insertPs.setString(1, "Stranger Things");
            insertPs.setInt(2, 2021);
             insertPs.setString(3, imagePath);
             insertPs.setString(4, "sci/fi");
           int rowsInserted= insertPs.executeUpdate();
            
            if (rowsInserted > 0) {
                %>
                <script>
    function showPopup() {
        document.getElementById("popup-container").style.display = "block";
        setTimeout(closePopup, 2500); // Close the popup after 3 seconds (3000 milliseconds)
    }

    function closePopup() {
        document.getElementById("popup-container").style.display = "none";
    }
    showPopup();
</script>
              <%
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}  
%>

                                        </div>
                                    </div>
                                </div>

                                <!---2------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                              <button value="insert1" class="heart-button" name="action" onclick="submitFormAndInsert()" type="submit">
                                                <i class="fa-solid fa-heart" aria-hidden="true"></i>
                                            </button>
                                        </a>

                                        <!--img--->
                                        <div class="main-slider-img">
                                            <img src="aaquaman.jpg" alt="Poster"/>
                                        </div>

                                        <!--text---->
                                        <div class="main-slider-text">
                                            <!--quality--> 
                                            <span class="quality">Full HD</span>

                                            <!--bottom text-->
                                            <div class="bottom-text">
                                                <!--name-->
                                                <div class="movie-name">
                                                    <span class="yeraPa2">2018</span>
                                                    <strong class="titlePa2">Aquaman </strong>
                                                     <h4 style="color:red;">Superhero</h4>
                                                </div>       
                                            </div>
                                            
                                          
                                         <div id="popup-container1" class="popup1">
    <span class="close1" onclick="closePopup1()">&times;</span>
    <p>Movie Added to Favorites Successfully!</p>
</div>
                                         
                                            <%

if (request.getMethod().equals("POST")) {
    String action = request.getParameter("action");

    if ("insert1".equals(action)) {
         
        try {
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/netflix");
            PreparedStatement insertPs = con.prepareStatement("INSERT INTO favourite (title, yera,img,genre) VALUES (?, ?, ?,?)");
           String imagePath = "aaquaman.jpg";
            // Inserting static values directly into the query
            insertPs.setString(1, "Aquaman");
            insertPs.setInt(2, 2018);
             insertPs.setString(3, imagePath);
             insertPs.setString(4, "superhero");
           int rowsInserted= insertPs.executeUpdate();
            
            if (rowsInserted > 0) {
                %>
                <script>
    function showPopup1() {
        document.getElementById("popup-container1").style.display = "block";
        setTimeout(closePopup1, 2500); // Close the popup after 3 seconds (3000 milliseconds)
    }

    function closePopup1() {
        document.getElementById("popup-container1").style.display = "none";
    }
    showPopup1();
</script>
              <%
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}  
%>
                                        </div>
                                    </div>
                                </div>


                                <!---3------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                             <button value="insert2" class="heart-button" name="action" onclick="submitFormAndInsert()" type="submit">
                                                <i class="fa-solid fa-heart" aria-hidden="true"></i>
                                            </button>
                                        </a>

                                        <!--img--->
                                        <div class="main-slider-img">
                                            <img src="nut.jpg" alt="Poster"/>
                                        </div>

                                        <!--text---->
                                        <div class="main-slider-text">
                                            <!--quality--> 
                                            <span class="quality">Full HD</span>

                                            <!--bottom text-->
                                            <div class="bottom-text">
                                                <!--name-->
                                                <div class="movie-name">
                                                    <span>2022</span>
                                                    <strong>The Nutcracker</strong>
                                                     <h4 style="color:red;">Fantasy</h4>
                                                </div>       
                                            </div>
                                            
                                               
                                         <div id="popup-container2" class="popup2">
    <span class="close2" onclick="closePopup2()">&times;</span>
    <p>Movie Added to Favorites Successfully</p>
</div>
                                         
                                            <%

if (request.getMethod().equals("POST")) {
    String action = request.getParameter("action");

    if ("insert2".equals(action)) {
         
        try {
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/netflix");
            PreparedStatement insertPs = con.prepareStatement("INSERT INTO favourite (title, yera,img,genre) VALUES (?, ?, ?,?)");
           String imagePath = "nut.jpg";
            // Inserting static values directly into the query
            insertPs.setString(1, "The Nutcracker");
            insertPs.setInt(2, 2022);
             insertPs.setString(3, imagePath);
             insertPs.setString(4, "fantasy");
           int rowsInserted= insertPs.executeUpdate();
            
            if (rowsInserted > 0) {
                %>
                <script>
    function showPopup2() {
        document.getElementById("popup-container2").style.display = "block";
        setTimeout(closePopup2, 2500); // Close the popup after 3 seconds (3000 milliseconds)
    }

    function closePopup2() {
        document.getElementById("popup-container2").style.display = "none";
    }
    showPopup2();
</script>
              <%
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}  
%>

 <div id="successMessage" style="display: none;">Data inserted successfully!</div>

                                        </div>
                                    </div>
                                </div>


                                <!---4------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                           <button value="insert3" class="heart-button" name="action" onclick="submitFormAndInsert()" type="submit">
                                                <i class="fa-solid fa-heart" aria-hidden="true"></i>
                                            </button>
                                        </a>

                                        <!--img--->
                                        <div class="main-slider-img">
                                            <img src="avengers.jpg" alt="Poster"/>
                                        </div>

                                        <!--text---->
                                        <div class="main-slider-text">
                                            <!--quality--> 
                                            <span class="quality">Full HD</span>

                                            <!--bottom text-->
                                            <div class="bottom-text">
                                                <!--name-->
                                                <div class="movie-name">
                                                    <span>2014</span>
                                                    <strong>Avengers </strong>
                                                     <h4 style="color:red;">Sci/Fi</h4>
                                                </div>       
                                            </div>
                                            
                                                                           
                                         <div id="popup-container3" class="popup3">
    <span class="close3" onclick="closePopup3()">&times;</span>
    <p>Movie Added to Favorites Successfully</p>
</div>
                                         
                                            <%

if (request.getMethod().equals("POST")) {
    String action = request.getParameter("action");

    if ("insert3".equals(action)) {
         
        try {
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/netflix");
            PreparedStatement insertPs = con.prepareStatement("INSERT INTO favourite (title, yera,img,genre) VALUES (?, ?, ?,?)");
           String imagePath = "avengers.jpg";
            // Inserting static values directly into the query
            insertPs.setString(1, "Avengers");
            insertPs.setInt(2, 2014);
             insertPs.setString(3, imagePath);
              insertPs.setString(4, "sci/fi");
           int rowsInserted= insertPs.executeUpdate();
            
            if (rowsInserted > 0) {
                %>
                <script>
    function showPopup3() {
        document.getElementById("popup-container3").style.display = "block";
        setTimeout(closePopup3, 2500); // Close the popup after 3 seconds (3000 milliseconds)
    }

    function closePopup3()) {
        document.getElementById("popup-container3").style.display = "none";
    }
    showPopup3();
</script>
              <%
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}  
%>
                                        </div>
                                    </div>
                                </div>


                                <!---5------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                             <button value="insert4" class="heart-button" name="action" onclick="submitFormAndInsert()" type="submit">
                                                <i class="fa-solid fa-heart" aria-hidden="true"></i>
                                            </button>
                                        </a>

                                        <!--img--->
                                        <div class="main-slider-img">
                                            <img src="Aladdin.jpg" alt="Poster"/>
                                        </div>

                                        <!--text---->
                                        <div class="main-slider-text">
                                            <!--quality--> 
                                            <span class="quality">Full HD</span>

                                            <!--bottom text-->
                                            <div class="bottom-text">
                                                <!--name-->
                                                <div class="movie-name">
                                                    <span>2020</span>
                                                    <strong>Aladdin </strong>
                                                     <h4 style="color:red;">Sci/Fi</h4>
                                                </div>       
                                            </div>
                                            
                                                                           
                                         <div id="popup-container4" class="popup4">
    <span class="close4" onclick="closePopup4()">&times;</span>
    <p>Movie Added to Favorites Successfully</p>
</div>
                                         
                                            <%

if (request.getMethod().equals("POST")) {
    String action = request.getParameter("action");

    if ("insert4".equals(action)) {
         
        try {
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/netflix");
            PreparedStatement insertPs = con.prepareStatement("INSERT INTO favourite (title, yera,img,genre) VALUES (?, ?, ?,?)");
           String imagePath = "Aladdin.jpg";
            // Inserting static values directly into the query
            insertPs.setString(1, "Aladdin");
            insertPs.setInt(2, 2020);
             insertPs.setString(3, imagePath);
              insertPs.setString(4, "sci/fi");
           int rowsInserted= insertPs.executeUpdate();
            
            if (rowsInserted > 0) {
                %>
                <script>
    function showPopup4() {
        document.getElementById("popup-container4").style.display = "block";
        setTimeout(closePopup4, 2500); // Close the popup after 3 seconds (3000 milliseconds)
    }

    function closePopup4() {
        document.getElementById("popup-container4").style.display = "none";
    }
    showPopup4();
</script>
              <%
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}  
%>
                                        </div>
                                    </div>
                                </div>


                                <!---6------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                             <button value="insert5" class="heart-button" name="action" onclick="submitFormAndInsert()" type="submit">
                                                <i class="fa-solid fa-heart" aria-hidden="true"></i>
                                            </button>
                                        </a>

                                        <!--img--->
                                        <div class="main-slider-img">
                                            <img src="Free Guy.jpg" alt="Poster"/>
                                        </div>

                                        <!--text---->
                                        <div class="main-slider-text">
                                            <!--quality--> 
                                            <span class="quality">Full HD</span>

                                            <!--bottom text-->
                                            <div class="bottom-text">
                                                <!--name-->
                                                <div class="movie-name">
                                                    <span>2023</span>
                                                    <strong>Free Guy </strong>
                                                     <h4 style="color:red;">Comedy</h4>
                                                </div>       
                                            </div>
                                            
                                                                           
                                         <div id="popup-container5" class="popup5">
    <span class="close5" onclick="closePopup5()">&times;</span>
    <p>Movie Added to Favorites Successfully</p>
</div>
                                         
                                            <%

if (request.getMethod().equals("POST")) {
    String action = request.getParameter("action");

    if ("insert5".equals(action)) {
         
        try {
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/netflix");
            PreparedStatement insertPs = con.prepareStatement("INSERT INTO favourite (title, yera,img,genre) VALUES (?, ?, ?,?)");
           String imagePath = "Free Guy.jpg";
            // Inserting static values directly into the query
            insertPs.setString(1, "Free Guy");
            insertPs.setInt(2, 2023);
             insertPs.setString(3, imagePath);
              insertPs.setString(4, "comedy");
           int rowsInserted= insertPs.executeUpdate();
            
            if (rowsInserted > 0) {
                %>
                <script>
    function showPopup5() {
        document.getElementById("popup-container5").style.display = "block";
        setTimeout(closePopup5, 2500); // Close the popup after 3 seconds (3000 milliseconds)
    }

    function closePopup5() {
        document.getElementById("popup-container5").style.display = "none";
    }
    showPopup5();
</script>
              <%
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}  
%>
                                        </div>
                                    </div>
                                </div>

                                <!---7------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                            <button value="insert6" class="heart-button" name="action" onclick="submitFormAndInsert()" type="submit">
                                                <i class="fa-solid fa-heart" aria-hidden="true"></i>
                                            </button>
                                        </a>

                                        <!--img--->
                                        <div class="main-slider-img">
                                            <img src="The Hunter Games.jpg" alt="Poster"/>
                                        </div>

                                        <!--text---->
                                        <div class="main-slider-text">
                                            <!--quality--> 
                                            <span class="quality">Full HD</span>

                                            <!--bottom text-->
                                            <div class="bottom-text">
                                                <!--name-->
                                                <div class="movie-name">
                                                    <span>2017</span>
                                                    <strong>The Hunger Games </strong>
                                                     <h4 style="color:red;">Thriller</h4>
                                                </div>       
                                            </div>
                                                                           
                                         <div id="popup-container6" class="popup6">
    <span class="close6" onclick="closePopup6()">&times;</span>
    <p>Movie Added to Favorites Successfully</p>
</div>
                                         
                                            <%

if (request.getMethod().equals("POST")) {
    String action = request.getParameter("action");

    if ("insert6".equals(action)) {
         
        try {
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/netflix");
            PreparedStatement insertPs = con.prepareStatement("INSERT INTO favourite (title, yera,img,genre) VALUES (?, ?, ?,?)");
           String imagePath = "The Hunter Games.jpg";
            // Inserting static values directly into the query
            insertPs.setString(1, "The Hunger Games");
            insertPs.setInt(2, 2017);
             insertPs.setString(3, imagePath);
              insertPs.setString(4, "thriller");
           int rowsInserted= insertPs.executeUpdate();
            
            if (rowsInserted > 0) {
                %>
                <script>
    function showPopup6() {
        document.getElementById("popup-container6").style.display = "block";
        setTimeout(closePopup6, 2500); // Close the popup after 3 seconds (3000 milliseconds)
    }

    function closePopup6() {
        document.getElementById("popup-container6").style.display = "none";
    }
    showPopup6();
</script>
              <%
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}  
%>
                                        </div>
                                    </div>
                                </div>


                                <!---8------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                            <button value="insert7" class="heart-button" name="action" onclick="submitFormAndInsert()" type="submit">
                                                <i class="fa-solid fa-heart" aria-hidden="true"></i>
                                            </button>
                                        </a>

                                        <!--img--->
                                        <div class="main-slider-img">
                                            <img src="Uncharted.jpg" alt="Poster"/>
                                        </div>

                                        <!--text---->
                                        <div class="main-slider-text">
                                            <!--quality--> 
                                            <span class="quality">Full HD</span>

                                            <!--bottom text-->
                                            <div class="bottom-text">
                                                <!--name-->
                                                <div class="movie-name">
                                                    <span>2019</span>
                                                    <strong>Uncharted </strong>
                                                     <h4 style="color:red;">Thriller</h4>
                                                </div>       
                                            </div>
                                        </div>
                                    </div>
                                                                   
                                         <div id="popup-container7" class="popup7">
    <span class="close7" onclick="closePopup7()">&times;</span>
    <p>Movie Added to Favorites Successfully</p>
</div>
                                         
                                            <%

if (request.getMethod().equals("POST")) {
    String action = request.getParameter("action");

    if ("insert7".equals(action)) {
         
        try {
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/netflix");
            PreparedStatement insertPs = con.prepareStatement("INSERT INTO favourite (title, yera,img) VALUES (?, ?, ?)");
           String imagePath = "Uncharted.jpg";
            // Inserting static values directly into the query
            insertPs.setString(1, "Uncharted");
            insertPs.setInt(2, 2019);
             insertPs.setString(3, imagePath);
              insertPs.setString(4, "thriller");
           int rowsInserted= insertPs.executeUpdate();
           
            
            if (rowsInserted > 0) {
                %>
                <script>
    function showPopup7() {
        document.getElementById("popup-container7").style.display = "block";
        setTimeout(closePopup7, 2500); // Close the popup after 3 seconds (3000 milliseconds)
    }

    function closePopup7() {
        document.getElementById("popup-container7").style.display = "none";
    }
    showPopup7();
</script>
              <%
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}  
%>

                                </div>
                            </div>
                        </div> 
                    </section>              


            <section class="home-section"id="search-section">
                <div class="tabcontent" id="search-movies">
                    <h2 style="padding-top: 20px;padding-bottom: 20px;">User Tab</h2>

                    <div class="container">
                        <div class="search-container1">

                            <input type="text" class="search-bar1" id="genre" name="genre" placeholder="Search By Genre...">
                            <button class="search-button1" value="search" type="submit" id="search-button" onclick="submitFormAndScroll()">
                                <p><a href="#search-section">Search</a></p></button> 


                        </div>
                    </div>
                </div>

                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">

                        
                              
                            </div>
                        </div>
                    </div>
                        </div>
                    </div>
                </div>


            </section>

                                        
                                        
                                        
      
 <section class="home-section" id="favouritemovie_section">
            <div class="tabcontent">
               
                    <h1 style="padding-top: 20px;padding-bottom: 20px;color:white; margin-left: 340px;">Display of Favourite Movies</h1>    
                    <div class="container">
                        <div class="search-container1">


                            <p style="color:white; margin-left: 370px">Your Favourite Movies List</</p>


                        </div>
                    </div>
            </div>
                    <!------SEARCHING 4 MOVIES AT ONCE--------->
                    <div class="swiper mySwiper1">
                        <div class="swiper-wrapper">
                            
                              <!------SEARCHING 4 MOVIES AT ONCE--------->
                        <div class="swiper mySwiper1">
                            <div class="swiper-wrapper">
                             
                            <%
                                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/netflix");
                                    PreparedStatement ps = new Conn().con.prepareStatement("SELECT title,yera,img,genre from favourite");
                                    ResultSet rs = ps.executeQuery();
                                    int count=0;
                                    
                                    while (rs.next() && count < 4) {
                                        String title7 = rs.getString("title");
                                        int year7 = rs.getInt("yera");
                                        String imagePath7 = rs.getString("img");
                                         String genre7 = rs.getString("genre");


                            %>
                            <!---1------------>
                            <div class="swiper-slide">
                                <!--box---->
                                <div class="main-slider-box"   name="movieContainer" id="searchResults">
                                    <!--text---->
                                    
                                        <a href="#" class="main-slider-overlay">
                                             <button class="heart-button"  name="action2" onclick="deleteMovie(this)" data-title="<%= title7 %>"  type="button">
                                                <i class="fa-solid fa-x" aria-hidden="true"></i>
                                            </button>
                                        </a>
                                   
                                    <div class="main-slider-img">
                                        <img src="<%= imagePath7%>" alt="Poster"/>
                                    </div>
                                    <div class="main-slider-text">
                                        <!--bottom text-->
                                        <div class="bottom-text">
                                             
                                            <div class="movie-name" style="margin-top:165px;">
                                                 <span><%= year7%></span>
                                      <strong><%= title7%></strong>
                                    <h4 style="color:red;"><%= genre7%></h4>
                                            </div>
                                          

                                        </div>
                                    </div>

                                </div>
                                    
                                     
                            </div>
                       

                        <%
                            }
                                con.close();
                          
                        %> 
                             <script>
                            function deleteMovie(button) {
    var title = button.getAttribute('data-title'); // Get the title from the button's data-title attribute
    var movieContainer = button.closest('[name="movieContainer"]'); // Find the parent container with the name "movieContainer"

    if (title && movieContainer) {
        movieContainer.remove(); // Remove the movie container from the DOM
    }
}
                            </script>
              </div>
                    </div>
                          </div>
                </div>
                        </section>
         


            <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/10.3.1/swiper-bundle.js"></script>

            <script>
                               var swiper = new Swiper(".mySwiper", {
                                slidesPerView: 1,
                                        spaceBetween: 10,
                                        pagination: {
                                        el: ".swiper-pagination",
                                                clickable: true,
                                        },
                                        loop: true,
                                        autoplay: {
                                        delay: 1700,
                                                disableOnInteraction: true,
                                        },
                                        breakpoints: {
                                        640: {
                                        slidesPerView: 2,
                                                spaceBetween: 20,
                                        },
                                                768: {
                                                slidesPerView: 4,
                                                        spaceBetween: 40,
                                                },
                                                1024: {
                                                    
                                                slidesPerView: 4,
                                                        spaceBetween: 30,
                                                        
                                                        
                                                },
                                        },
                                });
        
        
                 var swiper = new Swiper(".mySwiper1", {
                                slidesPerView: 1,
                                        spaceBetween: 10,
                                        pagination: {
                                        el: ".swiper-pagination",
                                                clickable: true,
                                        },
                                        loop: true,
                                        autoplay: {
                                        delay: 1700,
                                                disableOnInteraction: true,
                                        },
                                        breakpoints: {
                                        640: {
                                        slidesPerView: 2,
                                                spaceBetween: 20,
                                        },
                                                768: {
                                                slidesPerView: 4,
                                                        spaceBetween: 30,
                                                },
                                                1024: {
                                                    
                                                slidesPerView: 4,
                                                        spaceBetween: 40,
                                                  
                                                  
                                                        
                                                },
                                        },
                                });
                                
                                
                                
        
         
            let sidebar = document.querySelector(".sidebar");
  let closeBtn = document.querySelector("#btn");
  let searchBtn = document.querySelector(".bx-search");

  closeBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("open");
    menuBtnChange();//calling the function(optional)
  });

  searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search iocn
    sidebar.classList.toggle("open");
    menuBtnChange(); //calling the function(optional)
  });

  // following are the code to change sidebar button(optional)
  function menuBtnChange() {
   if(sidebar.classList.contains("open")){
     closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
   }else {
     closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
   }
  }
                //switching tabs

                // JavaScript function for tab switching
                function openCity(evt, cityName) {
                // Declare all variables
                var i, tabcontent, tablinks;
                // Get all elements with class="tabcontent" and hide them
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
                }

                // Get all elements with class="tablinks" and remove the class "active"
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
                }

                // Show the current tab, and add an "active" class to the clicked span
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
                }

       function submitFormAndScroll() {
                // Submit the form
                document.getElementById("myForm").submit();
                // Scroll to the section with id "search-section"
                var searchSection = document.getElementById("search-section");
                if (searchSection) {
                searchSection.scrollIntoView({ behavior: "smooth" });
                }
                }
        

        function submitFormAndScroll() {
                // Submit the form
                document.getElementById("myForm").submit();
                // Scroll to the section with id "search-section"
                var searchSection = document.getElementById("favouritemovie_section");
                if (searchSection) {
                searchSection.scrollIntoView({ behavior: "smooth" });
                }
                }
    
            </script>
        </form>
    </body>
</html> 
