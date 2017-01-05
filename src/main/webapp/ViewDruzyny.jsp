<%-- 
    Document   : ViewDruzyny
    Created on : 2017-01-04, 19:28:11
    Author     : draxeer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="page/head.jsp" />
        <script>
		$(document).ready(function()
			{	
			$.ajax
				(
                                    {
					url: '${pageContext.request.contextPath}/rest/druzyna/getAll',
					type: 'GET',
                                        
					success: function(w) {                                            
                                            for(var i=0;i<w.length;i++){
                                            var fulllink = '${pageContext.request.contextPath}/ShowDruzyne/?id='+ w[i].id_druzyna;
                                            var jumbo = document.createElement("div");
                                            jumbo.className = 'col-md-3';
                                            var inside = document.createElement("div");
                                            inside.className = 'thumbnail';
                                            
                                            var link = document.createElement('a');
                                            var elem = document.createElement("img");
                                            link.setAttribute("href", fulllink);
                                            elem.setAttribute("src", w[i].img);
                                               
                                            var name = document.createElement("div");
                                            name.className = 'caption';
                                            name.innerHTML = "<p class='text-center'>" + w[i].nazwaDruzyny + "</p>";
                                                
                                                link.appendChild(elem);                                             
                                                inside.appendChild(name);
                                                inside.appendChild(link);  
                                                jumbo.appendChild(inside);
                                                
                                                 document.body.appendChild(jumbo);
                                            }
                                        }
                                    }	
				);
			}
		);
	</script>      
    </head>
    <body>
        <jsp:include page="page/nav.jsp" />
       
        
    </body>
     <jsp:include page="page/footer.jsp" />
</html>
