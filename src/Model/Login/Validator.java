package Model.Login;

import Model.Database.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        if(x == 1) { //Admin
            PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE AdminEmail= ? AND AdminPassword= ?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            result = rs.next();
            con.close();
        } else if (x == 2) { //Faculty
            PreparedStatement ps = con.prepareStatement("SELECT * FROM faculty WHERE FacultyEmail= ? AND FacultyPassword= ?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            result = rs.next();
            con.close();
        } else if(x == 3) { //Student
            PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE StudentEmail= ? AND StudentPassword= ?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            result = rs.next();
            con.close();
        }
        return result;
    }
}
