<%-- 
    Document   : nav
    Created on : 2017-01-04, 18:37:32
    Author     : draxeer
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar navbar-inverse navbar-static-top">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Drużyny i Statystyki</a>
      <ul class="nav navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/ViewGraczy.jsp">Gracze</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/ViewDruzyny.jsp">Drużyny</a>
        </li>
      </ul>
</nav>