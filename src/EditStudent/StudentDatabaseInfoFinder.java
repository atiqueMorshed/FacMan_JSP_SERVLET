package EditStudent;

import Database.DBConnect;
import EditFaculty.FacultyDatabaseInfoFinder;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/9/2020.
 */
public class StudentDatabaseInfoFinder extends FacultyDatabaseInfoFinder {
    public int facultyFinder(String email) throws SQLException {
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE FacultyEmail=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            int StudentCourses = rs.getInt("StudentCourses");
            rs.close();
            con.close();
        }

        dbc = new DBConnect();
        con = dbc.getConnection();

        ps = con.prepareStatement("SELECT sc.FCID FROM s.student INNER JOIN sc.stcourses WHERE s.StudentCourses = sc.StudentCourses");
        ps.setString(1, email);
        rs = ps.executeQuery();
        if(rs.next()) {
            int facultyCourses = rs.getInt("FacultyCourses");
            rs.close();
            con.close();
            return facultyCourses;
        }
        return -1;
    }
}
