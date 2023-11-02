package ormRPGgame.model.Guerreros;

import ormRPGgame.model.Daga;

public class Guerrero {
    private String idGuerrrero;
    private Daga daga;

    public Guerrero(String idGuerrero,Daga daga){
        this.idGuerrrero=idGuerrero;
        this.daga=daga;
    }
    public String getIdGuerrrero(){return this.idGuerrrero;}
}
