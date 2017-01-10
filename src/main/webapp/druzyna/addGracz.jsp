<%-- 
    Document   : addGracz
    Created on : 2017-01-10, 17:59:31
    Author     : draxeer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../page/head.jsp" />
        <script>
		$(document).ready(function()
			{
				$( "#dodaj" ).on('click', function(e)
					{	
						e.preventDefault();
						$.ajax
						(
						{
						    url: '${pageContext.request.contextPath}/rest/gracz/add',
						    type: 'POST',
						    data:
							{
                                                                druzyna: document.getElementById('druzyna').value,
                                                                nickname: document.getElementById('nickname').value,
								pensja: document.getElementById('pensja').value,
                                                                dywizja: document.getElementById('dywizja').value		
							},
						    success: function(g) {
                                                        var i = g.druzyna.id_druzyna;
                                                        document.location.replace("${pageContext.request.contextPath}/ShowDruzyne/?id=${id}"); 
                                                    },
 						    error: function() { alert("Skiepsciles"); }
						}	
						);
					}
				);
			}
		);
	</script>
    </head>
    <body>
        <jsp:include page="../page/nav.jsp" />
    <form method="post">
	<div class="form-group">
            <label for="miasto" class="col-sm-2 control-label">Nickname:</label>
		<div class="col-sm-10">
		    <input type="text" name="nickname" id="nickname" class="form-control" value="">
		</div>
	</div>
	<div class="form-group">
            <label for="ulica" class="col-sm-2 control-label"> Dywizja:</label>
		<div class="col-sm-10">
		    <input type="text" name="dywizja" id="dywizja"  class="form-control" value="">
		</div>
	</div>
        <div class="form-group">
            <label for="nr" class="col-sm-2 control-label">Pensja:</label>
		<div class="col-sm-10">
		    <input type="text" name="pensja" id="pensja"  class="form-control" value="">
		</div>
        </div>
        <div class="form-group">
	<label for="druzyna" class="col-sm-2 control-label">Druzyna:</label>
            <div class="col-sm-10">
		<select type="text" name="druzyna" id="druzyna" class="form-control" required>
                    <c:forEach var="druzyna" items="${SpisDruzyn}" varStatus="loopCounter">
			<c:choose>
                            <c:when test="${druzyna.id_druzyna == id}">
				<option value="${druzyna.id_druzyna}" selected="selected">${druzyna.getNazwaDruzyny()}</option>
                            </c:when>
			<c:otherwise>
                            <option value="${druzyna.id_druzyna}">${druzyna.nazwaDruzyny}</option>
			</c:otherwise>
			</c:choose>
                    </c:forEach>
		</select>
            </div>
	</div>          
        
	<div class="form-group text-center">
            <button id="dodaj" type="submit" class="btn btn-primary">Dodaj</button>
            <a href="${pageContext.request.contextPath}/ShowDruzyne/?id=${id}" class="btn btn-default" role="button">Wróć</a>
	</div>
    </form>           
        
    </body>
    <jsp:include page="../page/footer.jsp" />
</html>