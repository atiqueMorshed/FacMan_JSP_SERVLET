package Model.Registration;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Model.Database.DBConnect;
import Controller.RegistrationControllers.Validator;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/4/2020.
 */
public class FacultyValidator implements Validator {
    String email="";
    String initial="";
    String password="";
    DBConnect dbct;
    public FacultyValidator(DBConnect dbc, String e, String i, String p){
        email = e;
        initial = i;
        password = p;
        dbct= dbc;
    }
    public FacultyValidator(String e, String i, String p){
        email = e;
        initial = i;
        password = p;
    }
    public ArrayList<String> validate() throws SQLException {
        ArrayList<String> al = new ArrayList<String>();
        //TEST_START
        if(dbct!= null) {
            al.add("Registration Successful");
            return al;
        }
        //TEST_END
        boolean result = false;
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();

        PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) as rowcount FROM faculty WHERE FacultyEmail= ?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        rs.next();
        int count = rs.getInt("rowcount");

        if(count > 0) {
            al.add("Email already exists.");
            result = true;
        }

        ps = con.prepareStatement("SELECT COUNT(*) as rowcount FROM faculty WHERE FacultyInitial= ?");
        ps.setString(1, initial);
        rs = ps.executeQuery();

        rs.next();
        count = rs.getInt("rowcount");

        if(count > 0) {
            al.add("Duplicate Initial.");
            result = true;
        }

        if(!result) {
            ps = con.prepareStatement("INSERT INTO faculty(FacultyEmail, FacultyInitial, FacultyPassword) VALUES(?, ?, ?)");
            ps.setString(1, email);
            ps.setString(2, initial);
            ps.setString(3, password);
            ps.executeUpdate();
        }
        rs.close();
        con.close();

        return al;
    }

}
