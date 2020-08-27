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
public class StudentValidator implements Validator {
    String email="";
    String password="";
    public StudentValidator(String e, String p){
        email = e;
        password = p;
    }
    public ArrayList<String> validate() throws SQLException {
        boolean result = false;
        ArrayList<String> al = new ArrayList<String>();
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();

        PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) as rowcount FROM student WHERE StudentEmail= ?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        rs.next();
        int count = rs.getInt("rowcount");

        if(count > 0) {
            al.add("Email already exists.");
            result = true;
        }

        if(!result) {
            ps = con.prepareStatement("INSERT INTO student(StudentEmail, StudentPassword) VALUES(?, ?)");
            ps.setString(1, email);
            ps.setString(2, password);
            ps.executeUpdate();
        }
        con.close();

        return al;
    }

}
