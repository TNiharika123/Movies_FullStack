<%-- 
    Document   : Home
    Created on : 13 Oct, 2023, 7:54:08 PM
    Author     : Personal
--%>

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
                        <a href="HomeDisplay.jsp#favouritemovie_section">
                            <i class='bx bx-heart' ></i>
                            <span class="links_name" onclick="openCity(event, 'favorite-movies')">
                                <button>Favourite Movies</button>
                            </span>
                        </a>
                        <span class="tooltip">Fvourite Movies</span>
                    </li>
                    <li>
                        <a href="#search-movies">
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
                                            <button value="insert" class="heart-button" onclick="submitFormAndInsert()" type="submit">
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
                                                    
                                                </div>       
                                            </div>
                                            
                                            
                                        
    <%
/*
if (request.getMethod().equals("POST")) {
    String titlePa = request.getParameter("titlePa");
    String yeraPa = request.getParameter("yeraPa");

    if (titlePa != null && yeraPa != null && !titlePa.isEmpty() && !yeraPa.isEmpty()) {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/netflix");
            PreparedStatement insertPs = con.prepareStatement("INSERT INTO favourite (titlePa, yeraPa) VALUES (?, ?)");

            insertPs.setString(1, titlePa);
            insertPs.setInt(2, Integer.parseInt(yeraPa));
            insertPs.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}*/
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
                                            <button class="heart-button" onclick="submitFormAndInsert()">
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
                                                </div>       
                                            </div>
                                            
                                                                                    
<%
   
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
                                            <button class="heart-button">
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
                                                </div>       
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!---4------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                            <button class="heart-button">
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
                                                </div>       
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!---5------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                            <button class="heart-button">
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
                                                </div>       
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!---6------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                            <button class="heart-button">
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
                                                </div>       
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!---7------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                            <button class="heart-button">
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
                                                </div>       
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!---8------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box">

                                        <!--overlay-->
                                        <a href="#" class="main-slider-overlay">
                                            <button class="heart-button">
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
                                                </div>       
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </section>              



                </div>

            </section>     


            <section class="home-section"id="search-section">
                <div class="tabcontent" id="search-movies">
                    <h2 style="padding-top: 20px;padding-bottom: 20px;">Search Movies By Genre</h2>

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

                        <!------SEARCHING 4 MOVIES AT ONCE--------->
                        <div class="swiper mySwiper">
                            <div class="swiper-wrapper">
                                <%
                                    String genre = request.getParameter("genre");
                                    if (genre != null) {
                                        PreparedStatement ps = new Conn().con.prepareStatement("SELECT title,yera,img from genretable where genre=?");
                                        ps.setString(1, genre);
                                        ResultSet rs = ps.executeQuery();

                                        int count = 0; // Counter for the number of results to display

                                        while (rs.next() && count < 4) { // Display up to 4 results
                                            String title = rs.getString("title");
                                            String year = rs.getString("yera");
                                             String imagePath = rs.getString("img");
                                %>
                                <!---1------------>
                                <div class="swiper-slide">
                                    <!--box---->
                                    <div class="main-slider-box" id="searchResults" >
                                        <!--text---->
                                        <div class="main-slider-img">
                                        <img src="<%= imagePath%>" alt="Poster"/>
                                    </div>
                                        <div class="main-slider-text">
                                            <!--bottom text-->
                                            <div class="bottom-text">
                                                <!--name-->

                                            </div>
                                        </div>
                                    </div>

                                    <label>Movie Name:</label>
                                    <input class="search-text" type="text" name="title<%= count%>" value="<%= title%>" />
                                    <label>Release Year:</label>
                                    <input class="search-text" type="text" name="year<%= count%>" value="<%= year%>" />
                                </div>
                                <%
                                            count++;
                                        }
                                        rs.close();
                                        ps.close();
                                    }
                                %>
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


                // Initially, display the first tab as active (you can choose a different default tab)
                //document.querySelector(".tablinks").click();
                function submitFormAndScroll() {
                // Submit the form
                document.getElementById("myForm").submit();
                // Scroll to the section with id "search-section"
                var searchSection = document.getElementById("search-section");
                if (searchSection) {
                searchSection.scrollIntoView({ behavior: "smooth" });
                }
                }
    
    
            </script>
        </form>
    </body>
</html> 
