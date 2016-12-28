package projekt2.service;

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
    public void edit(Gracz g, String nickname, Integer Pensja, String Dywizja, Druzyna d){
        g = lol.find(Gracz.class, g.getId_gracz());
        Druzyna druzyna = lol.find(Druzyna.class, g.getDruzyna());
        g.setDywizja(Dywizja);
        g.setNickname(nickname);
        g.setPensja(Pensja);
        g.setDruzyna(d);
        lol.merge(g);
    }
    public void del(Gracz g){
        g = lol.find(Gracz.class, g.getId_gracz());
        Druzyna druzyna = lol.find(Druzyna.class, g.getDruzyna());
        druzyna.getListaGraczy().remove(g);
        lol.remove(g);
    }
}