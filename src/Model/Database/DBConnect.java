package Model.Database;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/3/2020.
 */
public class DBConnect{
    public Connection getConnection() {
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/facultyman?serverTimezone=UTC#";
        String username = "root";
        String password = "";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
    public String getConnectionT() {
        return "con";
    }
}
