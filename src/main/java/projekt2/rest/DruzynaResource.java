package projekt2.rest;
import java.util.List;

import projekt2.domain.Druzyna;
import projekt2.service.DruzynaManager;

import javax.ejb.EJB;
import javax.ejb.Stateless;
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
@Path("/druzyna")
public class DruzynaResource {
    @EJB
    private DruzynaManager manager;

    @GET
    @Path("/getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Druzyna> getDruzyny() {
        return manager.getAll();
    }
    @POST
    @Path("/add")
    @Produces(MediaType.APPLICATION_JSON)
    public Druzyna add(
            @FormParam("nazwadruzyny") String nazwa,
            @FormParam("iloscgraczy") Integer ilosc,
            @FormParam("zalozyciel") String zal,
            @FormParam("img") String img)
    {
        Druzyna d = new Druzyna(nazwa,zal,ilosc,img);
        manager.add(d);

        return d;
    }
    @GET
    @Path("/view/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Druzyna view(@PathParam("id") long id) {
    	 return manager.getDruzyna(id);
    }
    



}
