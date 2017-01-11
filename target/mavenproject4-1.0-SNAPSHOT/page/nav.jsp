<%-- 
    Document   : nav
    Created on : 2017-01-04, 18:37:32
    Author     : draxeer
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<nav class="navbar navbar-inverse navbar-static-top">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Drużyny i Gracze</a>
      <ul class="nav navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/AddDruzyna">Dodaj nową drużynę</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/ViewDruzyny.jsp">Drużyny</a>
        </li>
      </ul>
        <ul class ="nav navbar-nav navbar-right">
        <form action="${pageContext.request.contextPath}/FindGracz/" class="navbar-form" role="search">
					<div class="input-group">
						<input type="text" name="nick" id="nick" class="form-control pull-right" placeholder="Wyszukaj gracza po nick`u">
						<span class="input-group-btn">
							<button type="submit" class="btn btn-default">
								<span class="glyphicon glyphicon-search">
									<span class="sr-only">Search</span>
								</span>
							</button>
						</span>
					</div>
        </form> 
        </ul>
        
</nav>