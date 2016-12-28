package projekt2.service;

import projekt2.domain.Druzyna;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
    public void edit(Druzyna druzyna, String nazwaDruzyny, String Zalozyciel, int liczbaGraczy, String img){
        druzyna = lol.find(Druzyna.class, druzyna.getId_druzyna());
        druzyna.setImg(img);
        druzyna.setLiczbaGraczy(liczbaGraczy);
        druzyna.setNazwaDruzyny(nazwaDruzyny);
        druzyna.setZalozyciel(Zalozyciel);
    }
    public void del(Druzyna d){
        d = lol.find(Druzyna.class, d.getId_druzyna());
        lol.remove(d);
    }
    public List<Druzyna> getAll(){
        return lol.createNamedQuery("druzyna.all").getResultList();
    }

}