package projekt2.domain;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import org.codehaus.jackson.annotate.JsonIgnore;
/**
 * @author draxeer
 */
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;

@Entity
@NamedQueries({
        @NamedQuery(name = "druzyna.all", query = "Select d from Druzyna d")
})
public class Druzyna {

    private Long id_druzyna;
    private String nazwaDruzyny;
    private String Zalozyciel;
    private Integer LiczbaGraczy;
    private String Img;
    private List<Gracz> listaGraczy = new ArrayList<Gracz>();

    public Druzyna(){ super(); }

    public Druzyna(String nazwaDruzyny, String Zalozyciel, int liczbaGraczy, String img){
        super();
        this.nazwaDruzyny = nazwaDruzyny;
        this.Zalozyciel = Zalozyciel;
        this.LiczbaGraczy = liczbaGraczy;
        this.Img = img;
        this.listaGraczy = new ArrayList<Gracz>();
    }
    public void dodajGracza(String nick, int pensja, String dyw) {
        Gracz Nowy = new Gracz(nick, pensja, dyw);
        listaGraczy.add(Nowy);
    }
    // AUTO GENERATED
    public String getZalozyciel() {
        return Zalozyciel;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId_druzyna(){ return id_druzyna; }

    public void setId_druzyna(Long id){
        this.id_druzyna = id;
    }
    public Integer getLiczbaGraczy() {return LiczbaGraczy;}
    public String getNazwaDruzyny() {
        return nazwaDruzyny;
    }

    @OneToMany(mappedBy = "druzyna", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JsonIgnore
    public List<Gracz> getListaGraczy() {
        return listaGraczy;
    }
    public String getImg() { return Img; }
    public void setListaGraczy(List<Gracz> listaGraczy) {
        this.listaGraczy = listaGraczy;
    }
    public void setZalozyciel(String zalozyciel) {
        Zalozyciel = zalozyciel;
    }
    public void setLiczbaGraczy(Integer liczbaGraczy) {LiczbaGraczy = liczbaGraczy;}
    public void setImg(String img) {
        Img = img;
    }
    public void setNazwaDruzyny(String nazwaDruzyny) {
        this.nazwaDruzyny = nazwaDruzyny;
    }
}
