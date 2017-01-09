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
               	<script>
		$(document).ready(function()
			{
				$( "#dodaj" ).on('click', function(e)
					{	
						e.preventDefault();
						$.ajax
						(
						{
						    url: '${pageContext.request.contextPath}/rest/druzyna/add',
						    type: 'POST',
						    data:
							{
								nazwadruzyny: document.getElementById('nazwa').value,
                                                                iloscgraczy: document.getElementById('liczba').value,
								zalozyciel: document.getElementById('zal').value,
								img: document.getElementById('link').value
								
							},
						    success: function() { document.location.replace("${pageContext.request.contextPath}/ViewDruzyny.jsp"); },
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
            <label for="miasto" class="col-sm-2 control-label">Nazwa drużyny:</label>
		<div class="col-sm-10">
		    <input type="text" name="Nazwa" id="nazwa" class="form-control" value="">
		</div>
	</div>
	<div class="form-group">
            <label for="ulica" class="col-sm-2 control-label"> Zalozyciel:</label>
		<div class="col-sm-10">
		    <input type="text" name="Zalozyciel" id="zal"  class="form-control" value="">
		</div>
	</div>
        <div class="form-group">
            <label for="nr" class="col-sm-2 control-label">Liczba graczy:</label>
		<div class="col-sm-10">
		    <input type="text" name="Liczba" id="liczba"  class="form-control" value="">
		</div>
        </div>
        <div class="form-group">
            <label for="nr" class="col-sm-2 control-label">Link do obrazka:</label>
		<div class="col-sm-10">
		    <input type="text" name="Link" id="link" class="form-control" value="">
		</div>
        </div>	
	<div class="form-group text-center">
            <button id="dodaj" type="submit" class="btn btn-primary">Dodaj</button>
            <a href="${pageContext.request.contextPath}/ShowDruzyne/?id=${id}" class="btn btn-default" role="button">Wróć</a>
	</div>

            	</form>          
    </body>
</html>
