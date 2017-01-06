<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>  
    <head>
        <jsp:include page="../page/head.jsp" />
        
         <script>
		$(document).ready(function()
			{	
			$.ajax
				(
                                    {  
					url: '${pageContext.request.contextPath}/rest/druzyna/view/<%=request.getAttribute("id")%>',
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
                <a href="#" title="Edytuj daną drużynę"  class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil"></span></a>
                <a href="#" title="Dodaj nowego gracza" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus"></span></a>
                <a href="#" title="Usuń drużynę" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-remove"></span></a>
                </p>
                </li>

                </ul>
            </div>
            </div>
            <div class="col-xs-6 col-md-9">
                <div class="panel panel-default">
                         <div class="panel-heading">Lista graczy</div>
                     <table class="table"><tr>
                        <th><strong>Nickname</strong></th>
                        <th><strong>Pensja</strong></th>
                        <th><strong>Dywizja</strong></th>
                        <th><strong>Edytuj gracza</strong></th>
                        <th><strong>Usuń gracza</strong></th>
                        <th><strong></strong></th>
                        </tr>       
                        
                        <tr>
                            <td><h5 style="font-size: larger"> #NICK1 </h5></td>
                            <td><h5 style="font-size: larger"> #PENSJA1 </h5></td>
                            <td><h5 style="font-size: larger"> #DYWIZJA1 </h5></td>
                            <td><a title="Edytuj gracza" href="#" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            </a>
                            </td>
                            <td><a title="Usuń gracza" href="" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a>   
                            </td>
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
