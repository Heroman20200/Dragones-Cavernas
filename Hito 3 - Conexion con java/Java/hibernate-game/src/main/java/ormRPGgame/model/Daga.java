package ormRPGgame.model;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@Table(name = "Daga")
public class Daga{
    @Id
    @Column(name = "tipo")
    private String tipo;

    public Daga() {}

    public Daga(String tipo)
    {
        this.tipo=tipo;
    }

    public String getTipo()
    {
        return this.tipo;
    }
}
