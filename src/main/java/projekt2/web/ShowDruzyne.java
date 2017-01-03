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

@WebServlet(urlPatterns = "/ShowDruzyna")
public class ShowDruzyne extends HttpServlet{
	
    @EJB
    private DruzynaManager om = new DruzynaManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("IDD", "351");
        request.getRequestDispatcher("/druzyna/overview.jsp").forward(request, response);
    }
	

}