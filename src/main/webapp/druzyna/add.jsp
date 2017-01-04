<%-- 
    Document   : add
    Created on : 2016-12-28, 18:39:40
    Author     : draxeer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../page/head.jsp" />
    </head>
    <body>
        <jsp:include page="../page/nav.jsp" />
        <form action="${pageContext.request.contextPath}/rest/druzyna/add" method="POST">
            Nazwa:<br>
                <input type="text" name="nazwadruzyny" value=""><br>
            Ilość graczy:<br>
                <input type="text" name="iloscgraczy" value=""><br><br>
            Założyciel:<br>
                <input type="text" name="zalozyciel" value=""><br><br>
            Link do obrazka :<br>
                <input type="text" name="img" value=""><br><br>
                <input type="submit" value="Submit">
        </form>            
    </body>
</html>
