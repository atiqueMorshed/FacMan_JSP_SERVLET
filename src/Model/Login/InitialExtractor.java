package Model.Login;

import Model.Database.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/4/2020.
 */
public class InitialExtractor extends FacultyExtractor {
    DBConnect dbct;
    public InitialExtractor() {}
    public InitialExtractor(DBConnect dbc) {
        dbct= dbc;
    }

    public String extractInitial(String email) throws SQLException {
        if(dbct!= null)
            return "FAO";
        String initial = "Error From FacultyExractor";
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM faculty WHERE FacultyEmail=?");
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            initial = rs.getString("FacultyInitial");
        }
        con.close();
        return initial;
    }
}
