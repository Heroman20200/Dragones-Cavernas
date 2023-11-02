package ormRPGgame.model.Ciudades;

public class Tienda {
    private int idTienda;
    private Ciudad ciudad;

    public Tienda(int idTienda, Ciudad ciudad)
    {
        this.idTienda=idTienda;
        this.ciudad= ciudad;
    }

    public int getIdTienda() {
        return idTienda;
    }
}
