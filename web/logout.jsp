<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
  
    <h1>You have been successfully logged out.</h1>
    
    <%
// Invalidate the session
   
    session.invalidate();

response.sendRedirect("signin.html");
%>
 
</body>
</html>