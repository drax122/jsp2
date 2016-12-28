<%-- 
    Document   : add
    Created on : 2016-12-28, 18:39:40
    Author     : draxeer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!221</h1>
        
  <form action="${pageContext.request.contextPath}/rest/druzyna/add" method="POST">
  Nazwa:<br>
  <input type="text" name="nazwadruzyny" value=""><br>
  Ilosc graczy:<br>
  <input type="text" name="iloscgraczy" value=""><br><br>
  zal:<br>
  <input type="text" name="zalozyciel" value=""><br><br>
  img:<br>
  <input type="text" name="img" value=""><br><br>
  <input type="submit" value="Submit">
</form>
        
        
    </body>
</html>
