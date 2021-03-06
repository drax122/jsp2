package projekt2.service;

import java.util.ArrayList;
import projekt2.domain.Druzyna;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import projekt2.domain.Gracz;
/**
 *
 * @author draxeer
 */
@Stateless
public class DruzynaManager {
    @PersistenceContext
    EntityManager lol;
 
    public void add(Druzyna d){
        d.setId_druzyna(null);
        lol.persist(d);
        lol.flush();
    }
    public Druzyna getDruzyna(Long id) {
        Druzyna d = lol.find(Druzyna.class, id);
        d.setLiczbaGraczy(d.getListaGraczy().size());
        
        
	return lol.find(Druzyna.class, id);
    }
    public void edit(Druzyna druzyna, String nazwaDruzyny, String Zalozyciel, String img){
        druzyna = lol.find(Druzyna.class, druzyna.getId_druzyna());
        druzyna.setImg(img);
        Integer d = druzyna.getListaGraczy().size();
        druzyna.setLiczbaGraczy(d);
        druzyna.setNazwaDruzyny(nazwaDruzyny);
        druzyna.setZalozyciel(Zalozyciel);
        
        lol.merge(d);
        lol.merge(druzyna);
        lol.flush();
    }
    public void del(Druzyna d){
        d = lol.find(Druzyna.class, d.getId_druzyna());
        lol.remove(d);
    }
    public List<Druzyna> getAll(){
        return lol.createNamedQuery("druzyna.all").getResultList();
    }
    
}
