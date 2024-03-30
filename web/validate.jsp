

<%@page import="java.sql.DriverManager"%>
<%@page import="netflizpckg.Conn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
    <body>
       
        <%
      /*      Connection con = new Conn().con;
    String action = request.getParameter("action");

    if ("signup".equals(action)) {
        // Code for signing up
        String email = request.getParameter("email");
       
    } else {
        // Code for login
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM signin WHERE email=? and password=?");
        ps.setString(1, u);
        ps.setString(2, p);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            // User exists, set session attribute and redirect to index.html
            session.setAttribute("username", u);
            response.sendRedirect("index.html");
        } else {
            // User does not exist or invalid credentials, redirect to error.html
            response.sendRedirect("error.html");
        }
    } */
            Connection con= new Conn().con;
            
          String email= request.getParameter("email");
          String password=request.getParameter("password");
      /*    
          PreparedStatement ps=con.prepareStatement("select * from signin where email=? and password=?");
          ps.setString(1,email);
          ps.setString(2,password);
          
          ResultSet rs= ps.executeQuery();
          if(rs.next())
          {
               //out.println("Email: " + rs.getString(1));
                     response.sendRedirect("HomeInsert.jsp");
                session.setAttribute("email",rs.getString(1) );
                // Set session attribute
               // session.setAttribute("email" , rs.getString(1));
              
                // Debugging: Print message
                //out.println("Redirecting to login.html");
             //response.sendRedirect("login.html");
          }
          else{
             
            
              response.sendRedirect("index.html");

         }*/
      
  if(email.equals("user@gmail.com") && password.equals("123"))
  
  {
      session.setAttribute("email",email);
      response.sendRedirect("HomeInsert.jsp");
  }
  else 
  {
      out.println("Error");
  }
    
            %>
        
    </body>
</html>  
