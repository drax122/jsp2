<%-- 
    Document   : edit
    Created on : 2017-01-09, 19:21:30
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
						    url: '${pageContext.request.contextPath}/rest/druzyna/edit/${DruzynaEdit.getId_druzyna()}',
						    type: 'PUT',
						    data:
							{
								nazwaDruzyny: document.getElementById('nazwa').value,
								zal: document.getElementById('zal').value,
								lgraczy: document.getElementById('liczba').value,
								link: document.getElementById('link').value
								
							},
						    success: function() { document.location.replace("${pageContext.request.contextPath}/ShowDruzyne/?id=${DruzynaEdit.getId_druzyna()}"); },
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
       
       <form action="${pageContext.request.contextPath}/rest/druzyna/edit/${DruzynaEdit.getId_druzyna()}" method="POST">


	<div class="form-group">
            <label for="miasto" class="col-sm-2 control-label">Nazwa drużyny:</label>
		<div class="col-sm-10">
		    <input type="text" name="Nazwa" id="nazwa" class="form-control" value="${DruzynaEdit.getNazwaDruzyny()}">
		</div>
	</div>
	<div class="form-group">
            <label for="ulica" class="col-sm-2 control-label"> Zalozyciel:</label>
		<div class="col-sm-10">
		    <input type="text" name="Zalozyciel" id="zal"  class="form-control" value="${DruzynaEdit.getZalozyciel()}">
		</div>
	</div>
        <div class="form-group">
            <label for="nr" class="col-sm-2 control-label">Liczba graczy:</label>
		<div class="col-sm-10">
		    <input type="text" name="Liczba" id="liczba"  class="form-control" value="${DruzynaEdit.getLiczbaGraczy()}">
		</div>
        </div>
        <div class="form-group">
            <label for="nr" class="col-sm-2 control-label">Link do obrazka:</label>
		<div class="col-sm-10">
		    <input type="text" name="Link" id="link" class="form-control" value="${DruzynaEdit.getImg()}">
		</div>
        </div>	
	<div class="form-group text-center">
            <button id="edytuj" type="submit" class="btn btn-primary">Edytuj</button>
            <a href="${pageContext.request.contextPath}/ShowDruzyne/?id=${DruzynaEdit.getId_druzyna()}" class="btn btn-default" role="button">Wróć</a>
	</div>
        </form>
       
       
       
       
    </body>
    <jsp:include page="../page/footer.jsp" />
</html>
