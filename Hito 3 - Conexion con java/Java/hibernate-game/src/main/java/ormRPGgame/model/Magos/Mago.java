package ormRPGgame.model.Magos;

import ormRPGgame.model.Daga;

import javax.persistence.*;

@Entity
@Table(name = "Mago")
public class Mago {
    @Id
    @Column(name = "idMago")
    private String idMago;

    @ManyToOne(optional = false)
    @JoinColumn(name="tipo")
    private Daga tipo;

    @Column(name="vida")
    private Long vida;

    @Column(name="nivel")
    private int nivel;

    @Column(name="fuerza")
    private Long fuerza;

    @Column(name="mana")
    private Long mana;

    @Column(name="oro")
    private int oro;

    public Mago() {}

    public Mago(String idMago, Daga tipo, Long vida, int nivel, Long fuerza, Long mana, int oro) {
        this.idMago = idMago;
        this.tipo = tipo;
        this.vida = vida;
        this.nivel = nivel;
        this.fuerza = fuerza;
        this.mana = mana;
        this.oro = oro;
    }

    public String getIdMago()
    {
        return this.idMago;
    }

    public int getNivel() {
        return this.nivel;
    }
}
