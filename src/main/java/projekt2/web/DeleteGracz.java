package projekt2.web;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import projekt2.domain.Gracz;


import projekt2.service.GraczManager;

@WebServlet(urlPatterns = "/DeleteGracz/*")
public class DeleteGracz extends HttpServlet{
	
    @EJB
    private GraczManager gm = new GraczManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Long id2 = Long.parseLong(request.getParameter("id2"));
        Gracz g = gm.getGracz(id);
        gm.del(g);
        response.sendRedirect("ViewDruzyny.jsp");
    }
}