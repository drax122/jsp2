<%-- 
    Document   : editGracz
    Created on : 2017-01-09, 21:10:33
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
				$( "#edytuj" ).on('click', function(e)
					{	
						e.preventDefault();
						$.ajax
						(
						{
						    url: '${pageContext.request.contextPath}/rest/gracz/edit/${GraczEdit.getId_gracz()}',
						    type: 'PUT',
						    data:
							{
								dywizja: document.getElementById('dywizja').value,
								nickname: document.getElementById('nickname').value,
								pensja: document.getElementById('pensja').value,
								id_druzyna: document.getElementById('druzyna').value
								
							},
						    success: function() { document.location.replace("${pageContext.request.contextPath}/ShowDruzyne/?id=${GraczEdit.getDruzyna().getId_druzyna()}"); },
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

        <form method="POST">
	<div class="form-group">
            <label for="miasto" class="col-sm-2 control-label">Dywizja: </label>
		<div class="col-sm-10">
		    <input type="text" name="dywizja" id="dywizja" class="form-control" value="${GraczEdit.getDywizja()}">
		</div>
	</div>
	<div class="form-group">
            <label for="ulica" class="col-sm-2 control-label">Nickname: </label>
		<div class="col-sm-10">
		    <input type="text" name="nickname" id="nickname"  class="form-control" value="${GraczEdit.getNickname()}">
		</div>
	</div>
        <div class="form-group">
            <label for="nr" class="col-sm-2 control-label">Pensja: </label>
		<div class="col-sm-10">
		    <input type="text" name="pensja" id="pensja"  class="form-control" value="${GraczEdit.getPensja()}">
		</div>
        </div>
                
	<div class="form-group">
	<label for="druzyna" class="col-sm-2 control-label">Druzyna:</label>
            <div class="col-sm-10">
		<select type="text" name="druzyna" id="druzyna" class="form-control" required>
                    <c:forEach var="druzyna" items="${SpisDruzyn}" varStatus="loopCounter">
			<c:choose>
                            <c:when test="${druzyna.id_druzyna == GraczEdit.getDruzyna().getId_druzyna()}">
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
            <button id="edytuj" type="submit" class="btn btn-primary">Edytuj</button>
            <a href="${pageContext.request.contextPath}/ShowDruzyne/?id=${GraczEdit.getDruzyna().getId_druzyna()}" class="btn btn-default" role="button">Wróć</a>
	</div>
        </form> 
        
    </body>
    <jsp:include page="../page/footer.jsp" />
</html>
