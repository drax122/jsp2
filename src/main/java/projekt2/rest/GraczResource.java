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
    
    @PUT
    @Path("/edit/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Gracz edit(
            @PathParam("id") Long id,
            @FormParam("nickname") String nick,
            @FormParam("pensja") Integer pensja,
            @FormParam("dywizja") String dywizja,
            @FormParam("id_druzyna") Long id_Druzyna)
    {
	Gracz g = new Gracz();
	g = gman.getGracz(id);
        gman.edit(nick, pensja, dywizja, g, dman.getDruzyna(id_Druzyna));

       return g;
    }


}
