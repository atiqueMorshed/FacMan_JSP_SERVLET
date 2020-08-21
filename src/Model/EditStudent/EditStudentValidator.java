package Model.EditStudent;

import Model.Database.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/26/2020.
 */
public class EditStudentValidator {
    boolean updated = false;
    String email="";
    String phone="";
    String dob="";
    String name="";
    String password="";
    public EditStudentValidator(String e, String ph, String d, String n, String p){
        email = e;
        phone = ph;
        dob = d;
        name= n;
        password = p;
    }
    public String validatePhone() throws SQLException {
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();

        PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) as rowcount FROM student WHERE Phone= ? AND StudentEmail != ?");
        ps.setString(1, phone);
        ps.setString(2, email);
        ResultSet rs = ps.executeQuery();
        rs.next();
        int count = rs.getInt("rowcount");
        rs.close();
        if(count > 0) {
            con.close();
            return "Duplicate phone.";
        } else {
            ps = con.prepareStatement("UPDATE student SET Phone=? WHERE StudentEmail=?");
            ps.setString(1, phone);
            ps.setString(2, email);
            updated = ps.executeUpdate() > 0;
            con.close();
        }
        if(updated) {
            return "Phone Updated.";
        }
        return "Phone Update Failed.";
    }
    public String validateNamePass() throws SQLException {
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();

        PreparedStatement ps = con.prepareStatement("UPDATE student SET StudentName=?,StudentPassword=?, DOB=? WHERE StudentEmail=?");
        ps.setString(1, name);
        ps.setString(2, password);
        ps.setString(3, dob);
        ps.setString(4, email);
        ps.executeUpdate();
        updated = ps.executeUpdate() > 0;
        con.close();
        if(updated) {
            return "Name Updated.\nPassword Updated.";
        }
        return "Name update failed.\nPassword update failed.";
    }
}
