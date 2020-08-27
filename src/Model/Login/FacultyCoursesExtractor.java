package Model.Login;

import Model.Database.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/17/2020.
 */
public class FacultyCoursesExtractor extends FacultyExtractor {
    public int extractFC(String email) throws SQLException {
        int FacultyCourses = -1;
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM faculty WHERE FacultyEmail=?");
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            FacultyCourses = rs.getInt("FacultyCourses");
        }
        con.close();
        return FacultyCourses;
    }
}


