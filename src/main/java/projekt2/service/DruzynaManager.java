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
	return lol.find(Druzyna.class, id);
    }
    public void edit(Druzyna druzyna, String nazwaDruzyny, String Zalozyciel, int liczbaGraczy, String img){
        druzyna = lol.find(Druzyna.class, druzyna.getId_druzyna());
        druzyna.setImg(img);
        druzyna.setLiczbaGraczy(liczbaGraczy);
        druzyna.setNazwaDruzyny(nazwaDruzyny);
        druzyna.setZalozyciel(Zalozyciel);
        lol.merge(druzyna);
    }
    public void del(Druzyna d){
        d = lol.find(Druzyna.class, d.getId_druzyna());
        lol.remove(d);
    }
    public List<Druzyna> getAll(){
        return lol.createNamedQuery("druzyna.all").getResultList();
    }
    
}
