package game.model;

public class Hacha {
    private String idHacha;
    private int daño;
    private int peso;

    public Hacha(String idHacha)
    {
        this.idHacha=idHacha;
    }

    public Hacha(String idHacha, int daño, int peso)
    {
        this.idHacha=idHacha;
        this.daño=daño;
        this.peso=peso;
    }
    public String getIdHacha() {
        return idHacha;
    }

    public int getDaño() {
        return daño;
    }

    public int getPeso() {
        return peso;
    }
}
