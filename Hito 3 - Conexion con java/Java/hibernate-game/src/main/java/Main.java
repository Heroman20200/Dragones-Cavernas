import ormRPGgame.Controller;
import ormRPGgame.model.Dragon.Dragon;

import ormRPGgame.model.Magos.Mago;
import ormRPGgame.model.Daga;

import java.sql.SQLException;

public class Main {

    public static void main (String [] args) {

        Controller controlador= new Controller();

        try {
            Daga daga= controlador.createDaga("madera");
            Mago mago= controlador.createMago("Raendan", daga);
            if(daga!=null && mago!=null)
                System.out.println("Se ha creado el mago "+mago.getIdMago()+" de nivel " + mago.getNivel() + " con la daga "+daga.getTipo());
        } catch(SQLException e) {
            System.err.println("Se ha producido un error en la conexión con la base de datos");
            e.printStackTrace();
        }

        //Pruebas dragon
        try {
            Dragon dehiss= new Dragon("Dehiss", 1000L);
            Dragon rannyexbea= new Dragon("Rannyexbea", 2000L);
            controlador.createDragon(dehiss);
            Dragon dragon= controlador.createDragon(rannyexbea.getNombre(), rannyexbea.getVida(), rannyexbea, dehiss);
            if(dragon!=null)
                System.out.println("Se ha creado el dragon " + dragon.getNombre() + " con la vida " + dragon.getVida());
        } catch(SQLException e) {
            System.err.println("Se ha producido un error en la conexión con la base de datos");
            e.printStackTrace();
        }
    }

}
