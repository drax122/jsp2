<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>  
    <head>
        <jsp:include page="../page/head.jsp" />
        <script>
		$(document).ready(function()
			{
				$( "#remove" ).on('click', function(e)
					{	
						e.preventDefault();
						$.ajax
						(
						{
						    url: '${pageContext.request.contextPath}/rest/druzyna/remove/${id}',
						    type: 'DELETE',
						    success: function() { document.location.replace("${pageContext.request.contextPath}/ViewDruzyny.jsp"); }
						}	
						);
					}
				);
			}
		);
	</script>
        
                 <script>
		$(document).ready(function()
			{	
			$.ajax
				(
                                    {  
					url: '${pageContext.request.contextPath}/rest/druzyna/view/${id}',
					type: 'GET',                         
					success: function(w) {
                                            var fulllink = '${pageContext.request.contextPath}/ShowDruzyne/?id='+ w.id_druzyna;
                                            var link = document.createElement('a');
                                            var elem = document.createElement("img");
                                            link.setAttribute("href", fulllink);
                                            elem.setAttribute("src", w.img);
                                            link.appendChild(elem);
                                            
                                            var name = document.createElement("p");
                                            name.className = 'text-center';
                                            name.innerHTML = w.nazwaDruzyny;
                                 
                                            var z = document.createElement("p");
                                            z.className = 'text-center';
                                            z.innerHTML = w.zalozyciel;
                                            
                                            var l = document.createElement("p");
                                            l.className = 'text-center';
                                            l.innerHTML = w.liczbaGraczy;
                                               
                                            
                                            document.getElementById('Nazwa').appendChild(name);
                                            document.getElementById('Zal').appendChild(z);
                                            document.getElementById('Liczba').appendChild(l); 
                                            document.getElementById('img').appendChild(link);
                                            }
                                    }   	
				);
			}
		);
	</script>
        
        <script>
		$(document).ready(function()
			{	
			$.ajax
				(
                                    {  
					url: '${pageContext.request.contextPath}/rest/gracz/allFromDruzyna/${id}',
					type: 'GET',                         
					success: function(g) {
                                            for(var i=0;i<g.length;i++){
                                                var tr = document.createElement("tr");                                 
                                                var td = document.createElement("td");
                                                td.innerHTML = g[i].dywizja;
                                            
                                                var td1 = document.createElement("td");
                                                td1.innerHTML = g[i].nickname;
                                            
                                                var td2 = document.createElement("td");
                                                td2.innerHTML = g[i].pensja;
                                                
                                                var td3 = document.createElement("td");
                                                
                                                var fulllink = '${pageContext.request.contextPath}/EditGracz/?id='+ g[i].id_gracz;
                                                var link = document.createElement('a');
                                                link.className = 'btn btn-default btn-sm';
                                                link.title = 'Edytuj gracza';
                                                var span = document.createElement('span');
                                                span.className = 'glyphicon glyphicon-pencil';
                                                
                                                link.setAttribute("href", fulllink);
                                                link.appendChild(span);
                                                td3.appendChild(link);
                                               
                                                
                                                var td4 = document.createElement("td");
                                                
                                                var fulllink2 = '${pageContext.request.contextPath}/DeleteGracz/?id='+ g[i].id_gracz + '&id2=${id}';
                                                var link2 = document.createElement('a');
                                                link2.className = 'btn btn-default btn-sm';
                                                link2.title = 'Usuń gracza';
                                                var span2 = document.createElement('span');
                                                span2.className = 'glyphicon glyphicon-remove';
                                                
                                                link2.setAttribute("href", fulllink2);
                                                link2.appendChild(span2);
                                                td4.appendChild(link2);
                                                

                                            
                                                tr.appendChild(td1);
                                                tr.appendChild(td2);
                                                tr.appendChild(td);
                                                tr.appendChild(td3);
                                                tr.appendChild(td4);
                                               $('#tabelaGraczy').append(tr);
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
        
<div class="container-fluid">
<div class="jumbotron" >
<div class="row">
    <div class="row">
        <div class="col-xs-6 col-md-3">
            <div id="img"></div>
            <div class="panel panel-default">
               
                <div class="panel-heading"><b>Dane drużyny: </b></div>
                <!-- List group -->
                <ul class="list-group">
 
                <li class="list-group-item" id ="Nazwa"><b>Nazwa;</b> </li>
                <li class="list-group-item" id="Zal"><b>Założyciel:</b> </li>
                <li class="list-group-item" id="Liczba"><b>Liczba graczy:</b> </li>
                
                <li class="list-group-item">
                <p class="text-center">
                <a href="${pageContext.request.contextPath}/EditDruzyna/?id=${id}" title="Edytuj daną drużynę"  class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil"></span></a>
                <button id="remove" type="submit" title="Usuń drużynę" class="glyphicon glyphicon-remove"></button>
                </p>
                </li>

                </ul>
            </div>
            </div>
            <div class="col-xs-6 col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading"><b>Lista graczy</b> <p class="text-right"><a href="${pageContext.request.contextPath}/AddGracz/?id=${id}" title="Dodaj nowego gracza" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span></a></p></div>
                     <table class="table" id="tabelaGraczy">
                         <tr>
                        <th><strong>Nickname</strong></th>
                        <th><strong>Pensja</strong></th>
                        <th><strong>Dywizja</strong></th>
                        <th><strong>Edytuj gracza</strong></th>
                        <th><strong>Usuń gracza</strong></th>
                        <th><strong></strong></th>
                        </tr>
                       
                    </table>
            </div>
        </div>
        </div>
     </div>
     </div>
    </div>
    </body>

</html>
