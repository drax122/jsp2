package projekt2.web;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import projekt2.domain.Druzyna;

import projekt2.service.DruzynaManager;

@WebServlet(urlPatterns = "/DeleteDruzyna/*")
public class DeleteDruzyna extends HttpServlet{
	
    @EJB
    private DruzynaManager dm = new DruzynaManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Druzyna d = dm.getDruzyna(id);
        dm.del(d);
        
        request.getRequestDispatcher("/ViewDruzyny.jsp").forward(request, response);
    }
	

}