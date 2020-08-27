package Model.Login;

import Model.Database.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/4/2020.
 */
public class FacultyExtractor implements Extractor {

    @Override
    public String extractName(String email) throws SQLException {
        String name = "Error From FacultyExractor";
        String initial;
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM faculty WHERE FacultyEmail=?");
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            name = rs.getString("FacultyName");

        }
        con.close();
        return name;
    }
}
