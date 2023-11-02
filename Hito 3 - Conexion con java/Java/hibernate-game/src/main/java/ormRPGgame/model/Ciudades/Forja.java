package ormRPGgame.model.Ciudades;

public class Forja {
    private int idForja;
    private Ciudad ciudad;

    public Forja(int idForja,Ciudad ciudad){
        this.idForja=idForja;
        this.ciudad=ciudad;
    }

    public int getIdForja() {
        return idForja;
    }
}
