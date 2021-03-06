package projekt2.service;

import java.util.ArrayList;
import java.util.List;
import projekt2.domain.Druzyna;
import projekt2.domain.Gracz;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
/**
 *
 * @author draxeer
 */
@Stateless
public class GraczManager {
    @PersistenceContext
    EntityManager lol;

    public void add(Gracz g){
        g.setId_gracz(null);
        lol.persist(g);
        lol.flush();
        
        Druzyna druzyna = lol.find(Druzyna.class, g.getDruzyna().getId_druzyna());
        Gracz gg = lol.find(Gracz.class, g.getId_gracz());
        druzyna.getListaGraczy().add(gg);
        lol.merge(druzyna);
        lol.flush();
        
    }
    public void edit(String nickname, Integer Pensja, String Dywizja, Gracz g, Druzyna d){
        g = lol.find(Gracz.class, g.getId_gracz());
        
        Druzyna druzyna = lol.find(Druzyna.class, g.getDruzyna().getId_druzyna()); // Stara d
        druzyna.getListaGraczy().remove(g);
        d.getListaGraczy().add(g);
        
        g.setDywizja(Dywizja);
        g.setNickname(nickname);
        g.setPensja(Pensja);
        g.setDruzyna(d);
        lol.merge(g);
        lol.flush();
        //Finalne musniecie tutaj / usunac z listy i dodac do listy 
    }
    public void del(Gracz g){
        g = lol.find(Gracz.class, g.getId_gracz());
        Druzyna druzyna = lol.find(Druzyna.class, g.getDruzyna().getId_druzyna());
        druzyna.getListaGraczy().remove(g);
        druzyna.setLiczbaGraczy(druzyna.getListaGraczy().size());
        lol.remove(g);
        lol.flush();
    }
    public List<Gracz> getAllDruzyna(Long id){
        Druzyna druzyna = lol.find(Druzyna.class, id);   
        
        return lol.createNamedQuery("gracz.allFrom").setParameter("d",druzyna).getResultList();
    } 
    public Gracz getGracz(Long id) {
	return lol.find(Gracz.class, id);
    }
    public List<Gracz> find(String nick){
        List<Gracz> a = lol.createNamedQuery("gracz.find").setParameter("nickname", nick).getResultList();
        return a;
    }

    
    
}