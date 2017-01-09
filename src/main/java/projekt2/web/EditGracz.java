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

@WebServlet(urlPatterns = "/EditGracz/*")
public class EditGracz extends HttpServlet{
	
    @EJB
    private GraczManager gm = new GraczManager();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/druzyna/editGracz.jsp").forward(request, response);
    }	
}