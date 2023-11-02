package ormRPGgame.model.Tanques;

import ormRPGgame.model.Daga;

public class Tanque {
    private String idTanque;
    private Daga daga;

    public Tanque(String idTanque, Daga daga)
    {
        this.idTanque=idTanque;
        this.daga=daga;
    }

    public String getIdTanque() {
        return idTanque;
    }
}
