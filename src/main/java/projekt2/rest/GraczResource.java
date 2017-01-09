package projekt2.rest;
import java.util.List;

import projekt2.domain.*;
import projekt2.service.*;


import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.servlet.http.HttpServlet;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.PUT;

@Stateless
@Path("/gracz")
public class GraczResource {
    @EJB
    private GraczManager gman;
    @EJB
    private DruzynaManager dman;
    
    @GET
    @Path("/allFromDruzyna/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Gracz> view(@PathParam("id") long id) {
    	 return gman.getAllDruzyna(id);
    }


}
