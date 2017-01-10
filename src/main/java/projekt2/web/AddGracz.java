package projekt2.web;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import projekt2.domain.Gracz;
import projekt2.service.DruzynaManager;
import projekt2.service.GraczManager;

@WebServlet(urlPatterns = "/AddGracz/*")
public class AddGracz extends HttpServlet{
	
    @EJB
    private GraczManager gm = new GraczManager();
    @EJB
    private DruzynaManager dm = new DruzynaManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        request.setAttribute("id", id);
        request.setAttribute("SpisDruzyn", dm.getAll());  
        request.getRequestDispatcher("/druzyna/addGracz.jsp").forward(request, response);
    }
	

}