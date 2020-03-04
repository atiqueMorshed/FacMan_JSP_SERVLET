package Login;

import Database.DBConnect;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Database.DBConnect;
/**
 * Created by [Atique Morshed Sami] [17101076] on 3/4/2020.
 */
public class Validator {
    public int x;
    public Validator(int x) {
        this.x=x;
    }
    public boolean validate(String email, String password) throws SQLException {
        boolean result = false;
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        if(x == 1) {
                PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE AdminEmail= ? AND AdminPassword= ?");
                ps.setString(1, email);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                result = rs.next();
                con.close();
        }
        return result;
    }
}