<%-- 
    Document   : findGracz
    Created on : 2017-01-11, 13:47:44
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
			$.ajax
				(
                                    {  
					url: '${pageContext.request.contextPath}/rest/gracz/find/${nickname}',
					type: 'GET',                         
					success: function(g) {
                                            if(!g.length) {
                                                var div = document.createElement("div");
                                                div.className = 'alert alert-danger';
                                                div.innerHTML = 'Nie znaleziono typa';
                                                div.role = 'alert';
                                                                                                                                                
                                                document.body.appendChild(div);
                                            }
                                            else{
                                            for(var i=0;i<g.length;i++){
                                            
                                            var tr = document.createElement("tr");                                 
                                                var td = document.createElement("td");
                                                td.innerHTML = g[i].nickname;
                                            
                                                var td1 = document.createElement("td");
                                                td1.innerHTML = g[i].pensja;
                                            
                                                var td2 = document.createElement("td");
                                                td2.innerHTML = g[i].dywizja;
                                                
                                                var td3 = document.createElement("td");
                                                
                                                var fulllink = '${pageContext.request.contextPath}/ShowDruzyne/?id='+ g[i].druzyna.id_druzyna;
                                                var link = document.createElement('a');
                                                link.innerHTML = g[i].druzyna.nazwaDruzyny;
                                                link.title = 'Edytuj gracza';
                                                
                                                
                                                link.setAttribute("href", fulllink);
                                                
                                                td3.appendChild(link);                                            
                                            
                                                tr.appendChild(td);
                                                tr.appendChild(td1);
                                                tr.appendChild(td2);
                                                tr.appendChild(td3);
                                               $('#tabelaGraczy').append(tr);   
                                            }
                                            }
                                        }
                                    }   	
				);
			}
		);
	</script> 
        
    </head>
    <body>
        <jsp:include page="../page/nav.jsp" />
                    <table class="table" id="tabelaGraczy">
                         <tr>
                        <th><strong>Nickname</strong></th>
                        <th><strong>Pensja</strong></th>
                        <th><strong>Dywizja</strong></th>
                        <th><strong>Nazwa drużyny</strong></th>
                        <th><strong></strong></th>
                        </tr>
                       
                    </table>
        
        
        
        
    </body>
     <jsp:include page="../page/footer.jsp" />
</html>
