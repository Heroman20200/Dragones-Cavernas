package ormRPGgame.model.Dragon;

import javax.persistence.*;

@Entity
@Table(name = "Grupo")
public class Grupo {
    @Id
    @Column(name= "idGrupo")
    private int idGrupo;

    public Grupo() {}

    public Grupo(int idGrupo){
        this.idGrupo=idGrupo;
    }

    public int getIdGrupo() {
        return idGrupo;
    }

}
