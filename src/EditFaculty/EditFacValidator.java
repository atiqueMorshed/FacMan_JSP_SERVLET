package EditFaculty;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Database.DBConnect;
import com.mysql.cj.x.protobuf.MysqlxPrepare;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/4/2020.
 */
public class EditFacValidator {
    boolean updated = false;
    String email="";
    String initial="";
    String name="";
    String password="";
    EditFacValidator(String e, String i, String n, String p){
        email = e;
        initial = i;
        name= n;
        password = p;
    }
    public String validateInitial() throws SQLException {
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();

        PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) as rowcount FROM faculty WHERE FacultyInitial= ? AND FacultyEmail != ?");
        ps.setString(1, initial);
        ps.setString(2, email);
        ResultSet rs = ps.executeQuery();
        rs.next();
        int count = rs.getInt("rowcount");
        rs.close();
        if(count > 0) {
            con.close();
            return "Duplicate initial.";
        } else {
            ps = con.prepareStatement("UPDATE faculty SET FacultyInitial=? WHERE FacultyEmail=?");
            ps.setString(1, initial);
            ps.setString(2, email);
            updated = ps.executeUpdate() > 0;
            con.close();
        }
        if(updated) {
            return "Initial Updated.";
        }
        return "Initial Update Failed.";
    }
    public String validateNamePass() throws SQLException {
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();

        PreparedStatement ps = con.prepareStatement("UPDATE faculty SET FacultyName=?,FacultyPassword=? WHERE FacultyEmail=?");
        ps.setString(1, name);
        ps.setString(2, password);
        ps.setString(3, email);
        ps.executeUpdate();
        updated = ps.executeUpdate() > 0;
        if(updated) {
            return "Name Updated.\nPassword Updated.";
        }
        return "Name update failed.\nPassword update failed.";
    }
}
