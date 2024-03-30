<%-- 
    Document   : search
    Created on : 12 Oct, 2023, 10:51:29 PM
    Author     : Personal
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="netflizpckg.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            /*
 try {
   
             Connection con= new Conn().con;
               String genre = request.getParameter("genre");
               
     String query = "SELECT * FROM genretable WHERE genre = ?";
     PreparedStatement statement = con.prepareStatement(query);
    
     statement.setString(1, genre);
     ResultSet resultSet = statement.executeQuery();
            
     while (resultSet.next()) {
        
     }
     resultSet.close();
     statement.close();
     con.close();
 } catch (SQLException e) {
     e.printStackTrace();
 }*/
            String genre = request.getParameter("genre");
            String title = "";
            if (genre != null) {
                PreparedStatement ps = new Conn().con.prepareStatement("SELECT title from genretable where genre=?");
                ps.setString(1,genre);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    title = rs.getString(1);
               } else {%>
        <script type="text/javascript">
            alert("Department id does not exist");
        </script>
        <%}
            }
            if (genre == null) {
                genre = "";
            }
        %>
       <form action="search.jsp" method="POST">
            <input type="text" name="genre" value="<%= genre%>" />
            <input type="text" name="title" value="<%= title%>" />
            <input type="submit" value="search" />
        </form>

    </body>
</html>
