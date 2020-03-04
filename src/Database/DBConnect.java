package Database;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/3/2020.
 */
public class DBConnect implements DBInfo {
    static Connection con = null;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
