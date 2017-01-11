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

@WebServlet(urlPatterns = "/FindGracz/*")
public class FindGracz extends HttpServlet{
	
    @EJB
    private DruzynaManager dm = new DruzynaManager();
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nick = request.getParameter("nick");
        request.setAttribute("nickname", nick);
        request.getRequestDispatcher("/druzyna/findGracz.jsp").forward(request, response);
    }
	

}