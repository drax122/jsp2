/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

@WebServlet(urlPatterns = "/EditDruzyna/*")
public class EditDruzyne extends HttpServlet{
    @EJB
    private DruzynaManager dman = new DruzynaManager();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	Long id = Long.parseLong(request.getParameter("id"));
        request.setAttribute("DruzynaEdit", dman.getDruzyna(id));
        
        request.getRequestDispatcher("/druzyna/edit.jsp").forward(request, response);
    }
}
