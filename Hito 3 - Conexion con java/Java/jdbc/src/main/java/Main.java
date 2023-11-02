import java.sql.*;
import java.util.LinkedList;
import java.util.List;
import game.model.Dragon;
import game.model.Hacha;

public class Main {
    // @TODO: Sustituya xxxx por los parámetros de su conexión

    private static final String DB_SERVER = "127.0.0.1";

    private static final int DB_PORT = 3306;

    private static final String DB_NAME = "DC";

    private static final String DB_USER = "root";

    private static final String DB_PASS = "pass";

    private static Connection conn;

    public static void main(String[] args) throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://" + DB_SERVER + ":" + DB_PORT + "/" + DB_NAME;
        conn = DriverManager.getConnection(url, DB_USER, DB_PASS);

        //Prueba de la función de añadir un nuevo dragón
        nuevo_dragon("Viseryon");
        PreparedStatement stmt= conn.prepareStatement("SELECT * FROM dragon");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String nombre = rs.getString("nombre");
            int vida = rs.getInt(2);
            System.out.println("nombre = " + nombre + "; vida = " + vida);
        }

        System.out.println();

        //Prueba función de mostrar dragones derrotados por un equipo
        List<Dragon> lista_dragones=squad_derrota_dragones(1L);
        for(Dragon i:lista_dragones)
            System.out.println("(" + i.getName() + ", "  + i.getLife() + ")");

        System.out.println();

        //Prueba función de mostrar las hachas que se pueden forjar en una determinada forja
        List<Hacha> lista_hachas=mostrar_hachas("Forja de Tébez");
        for(Hacha i:lista_hachas)
            System.out.println("(" + i.getIdHacha() + ", daño: " + i.getDaño() + ", peso: "  + i.getPeso() + ")");

        System.out.println();

        //Prueba función de mostrar el arma que porta cierto guerrero
        System.out.println(espada_porta_guerrero("Stanto"));

        conn.close();
    }

    // @TODO resuelva las siguientes funciones...

    public static void nuevo_dragon(String nombre) throws SQLException {
        // @TODO: complete este método para que cree un nuevo dragón en la base de datos
        Statement st = conn.createStatement();
        Dragon d= new Dragon(nombre, 7000);

        st.executeUpdate("INSERT INTO dragon (nombre, vida) VALUES ('"+ d.getName() + "', "+ d.getLife() +") ");
    }

    public static List<Dragon> squad_derrota_dragones(Long id_squad) throws SQLException {
        // @TODO: complete este método para que devuelva una lista de los dragones derrotados por el squad
        // Tenga en cuenta que la consulta a la base de datos le devolverá un ResultSet sobre el que deberá
        // ir iterando y creando un objeto dragon para cada uno de los dragones, y añadirlos a la lista
        List<Dragon> lista= new LinkedList<>();

        PreparedStatement stmt= conn.prepareStatement("SELECT nombre, idGrupo FROM grupo_derrota_dragon");
        ResultSet rs = stmt.executeQuery();

        while(rs.next()){
            long idGrupo= rs.getInt(2);
            if(id_squad==idGrupo){
                String nombre= rs.getString("nombre");
                PreparedStatement stmt2= conn.prepareStatement("SELECT * FROM dragon");
                ResultSet rs2 = stmt2.executeQuery();
                while(rs2.next())
                {
                    String nombre_aux= rs2.getString("nombre");
                    if(nombre_aux.equals(nombre))
                    {
                        Dragon dragon= new Dragon(nombre_aux,rs2.getInt(2));
                        if(!lista.contains(dragon));
                        lista.add(dragon);
                    }
                }
            }
        }

        return lista;
    }

    public static List<Hacha> mostrar_hachas(String nombre_forja) throws SQLException {
        // @TODO: complete este método para que muestre por pantalla las hachas que pueden forjarse en "nombre_forja"
        List<Hacha> lista= new LinkedList<>();

        PreparedStatement stmt= conn.prepareStatement("SELECT idForja, mote FROM forja");
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            String mote=rs.getString("mote");
            if(nombre_forja.equals(mote))
            {
                int idForja = rs.getInt(1);

                PreparedStatement stmt2= conn.prepareStatement("SELECT idForja,idHacha FROM tanque_forja");
                ResultSet rs2 = stmt2.executeQuery();

                while (rs2.next()) {
                    int idForja_2 = rs2.getInt(1);
                    if(idForja== idForja_2)
                    {
                        String idHacha= rs2.getString("idHacha");

                        PreparedStatement stmt3= conn.prepareStatement("SELECT * FROM hachas");
                        ResultSet rs3 = stmt3.executeQuery();
                        while (rs3.next()) {
                            String idHacha_aux= rs3.getString("idHacha");
                            if(idHacha_aux.equals(idHacha))
                            {
                                Hacha hacha= new Hacha(idHacha_aux, rs3.getInt(2), rs3.getInt(3));

                                if(!lista.contains(hacha))
                                    lista.add(hacha);
                            }
                        }
                    }
                }
            }
        }
        return lista;
    }

    public static String espada_porta_guerrero(String nombre_guerrero) throws SQLException {
        // @TODO: complete este método para que devuelva el nombre de la espada que porta el guerrero "nombre_guerrero"

        String espada= "ninguna";

        PreparedStatement stmt= conn.prepareStatement("SELECT * FROM guerrero_arma");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            if(nombre_guerrero.equals(rs.getString("idGuerrero")))
                espada=rs.getString("idEspada");
        }
        return espada;
    }
}
