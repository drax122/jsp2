/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projekt2.domain;

import projekt2.domain.Druzyna;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

/**
 *
 * @author draxeer
 */
@Entity
@NamedQueries({
        @NamedQuery(name = "gracz.all", query = "Select g from Gracz g")
})
public class Gracz {
    private Long id_gracz;
    private String Nickname = "s";
    private int Pensja = 100;
    private String Dywizja = "s";
    private Druzyna druzyna;

    public Gracz(){ super(); }
    public Gracz(String nick, int pensja, String dyw){
        super();
        this.Nickname = nick;
        this.Pensja = pensja;
        this.Dywizja = dyw;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId_gracz(){return id_gracz;}
    public String getNickname(){return Nickname;}
    public int getPensja() { return Pensja;}
    public String getDywizja(){return Dywizja;}
    @ManyToOne
    @JoinColumn(name = "id_druzyna", nullable = false)
    public Druzyna getDruzyna(){return druzyna;}

    public void setDruzyna(Druzyna d){ this.druzyna = d;}
    public void setNickname(String nick){this.Nickname=nick;}
    public void setPensja(int pen){this.Pensja=pen;}
    public void setDywizja(String dyw){this.Dywizja=dyw;}
    public void setId_gracz(Long id){this.id_gracz=id;}
}