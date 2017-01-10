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
    }
    public void edit(String nickname, Integer Pensja, String Dywizja, Gracz g, Druzyna d){
        g = lol.find(Gracz.class, g.getId_gracz());
        Druzyna druzyna = lol.find(Druzyna.class, g.getDruzyna().getId_druzyna());
        g.setDywizja(Dywizja);
        g.setNickname(nickname);
        g.setPensja(Pensja);
        g.setDruzyna(d);
        lol.merge(g);
    }
    
    public void del(Gracz g){
        g = lol.find(Gracz.class, g.getId_gracz());
        Druzyna druzyna = lol.find(Druzyna.class, g.getDruzyna().getId_druzyna());
        druzyna.getListaGraczy().remove(g);
        lol.remove(g);
    }
    public List<Gracz> getAllDruzyna(Long id){
        Druzyna druzyna = lol.find(Druzyna.class, id);   
        
        return lol.createNamedQuery("gracz.allFrom").setParameter("d",druzyna).getResultList();
    } 
    public Gracz getGracz(Long id) {
	return lol.find(Gracz.class, id);
    }
    
    
}