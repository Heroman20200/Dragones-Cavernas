package ormRPGgame.model.Dragon;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Dragon")
public class Dragon {
    @Id
    @Column(name= "nombre",  nullable = false)
    private String nombre;

    @Column(name="vida",  nullable = false)
    private Long vida;

    @ManyToMany(mappedBy = "dragon_es_desbloqueado")
    private Set<Dragon> dragon_desbloquea;

    @ManyToMany()
    @JoinTable(name = "dragon_desbloquea_dragon")
    private Set<Dragon> dragon_es_desbloqueado;

    public Dragon() {}

    public Dragon(String nombre, Long vida)
    {
        this.nombre=nombre;
        this.vida=vida;
        this.dragon_desbloquea= new HashSet<>();
        this.dragon_es_desbloqueado= new HashSet<>();
    }

    public Dragon(String nombre, Long vida, Set<Dragon> dragon_desbloquea, Set<Dragon> dragon_es_desbloqueado) {
        this.dragon_desbloquea = dragon_desbloquea;
        this.dragon_es_desbloqueado = dragon_es_desbloqueado;
        this.nombre = nombre;
        this.vida = vida;
    }

    public String getNombre() {
        return nombre;
    }

    public Long getVida() {
        return vida;
    }

}
