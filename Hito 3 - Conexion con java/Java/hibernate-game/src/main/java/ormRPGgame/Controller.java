package ormRPGgame;

import ormRPGgame.model.Dragon.Dragon;
import ormRPGgame.model.Magos.Mago;
import ormRPGgame.model.Daga;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import java.sql.*;
import java.util.HashSet;
import java.util.Set;


/**
 * Controlador de la aplicación. Por favor, revise detenidamente la clase y complete las partes omitidas
 * atendiendo a los comentarios indicados mediante @TODO
 */
public class Controller {

    private Session session;

    /**
     * Crea un nuevo controlador
     */
    public Controller () {

        StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                .configure()
                .build();

        SessionFactory sessionFactory = new MetadataSources(registry)
                .buildMetadata()
                .buildSessionFactory();

        this.session = sessionFactory.openSession();
    }

    /**
     * Crea un nuevo mago
     * param nickname nombre de usuario
     * @return el nuevo usuario creado
     * @throws SQLException
     */
    public Daga createDaga(String nombre) throws SQLException{
        // @TODO complete este metodo para crear de forma presistente una daga
        Daga daga = new Daga(nombre);
        session.beginTransaction();
        session.save(daga);
        session.getTransaction().commit();
        return daga;
    }

    public Mago createMago(String magician, Daga daga) throws SQLException {
        // @TODO complete este metodo para crear de forma presistente un mago
        Mago mago= new Mago(magician, daga, 70L, 2, 50L, 150L, 20);
        session.beginTransaction();
        session.save(mago);
        session.getTransaction().commit();
        return mago;
    }

    public Dragon createDragon(Dragon dragon) throws SQLException {
        // @TODO complete este metodo para crear de forma presistente un mago
        Dragon res= new Dragon(dragon.getNombre(), dragon.getVida());

        session.beginTransaction();
        session.save(dragon);
        session.getTransaction().commit();

        return res;
    }

    public Dragon createDragon(String nombre, Long vida, Dragon dragon1, Dragon dragon2) throws SQLException {
        // @TODO complete este metodo para crear de forma presistente un mago
        Set<Dragon> dragon_desbloquea= new HashSet<>();
        Set<Dragon> dragon_es_desbloqueado= new HashSet<>();

        dragon_desbloquea.add(dragon1);
        dragon_es_desbloqueado.add(dragon2);

        Dragon dragon= new Dragon(nombre, vida, dragon_desbloquea, dragon_es_desbloqueado);

        session.beginTransaction();
        session.save(dragon);
        session.getTransaction().commit();

        return dragon;
    }
}
