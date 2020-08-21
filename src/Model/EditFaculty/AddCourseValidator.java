package Model.EditFaculty;

import Model.Database.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static java.lang.Integer.parseInt;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/5/2020.
 */
public class AddCourseValidator {
    int courseID;
    int section;
    int day;
    int time;
    int totalSeat;
    String email;
    public AddCourseValidator(int cid, int s, int d, int t, int ts, String e) {
        courseID = cid;
        section = s;
        day = d;
        time = t;
        totalSeat = ts;
        email = e;
    }

    public String validate() throws SQLException {
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();

        // First check: same section + course ase naki
        PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) as rowcount FROM facourses WHERE CourseID=? AND Section=?");
        ps.setInt(1, courseID);
        ps.setInt(2, section);
        ResultSet rs = ps.executeQuery();

        rs.next();
        int count = rs.getInt("rowcount");
        rs.close();
        if(count > 0) {
            con.close();
            return "The section of the course already exists.";
        }
        // Extracting FacultyCourses for Second check
        ps = con.prepareStatement("SELECT FacultyCourses FROM faculty WHERE FacultyEmail=?");
        ps.setString(1, email);
        rs = ps.executeQuery();
        int facultyCourses;
        if(rs.next()) {
            facultyCourses = parseInt(rs.getString("FacultyCourses"));
            rs.close();
        } else{
            rs.close();
            con.close();
            return "Cant Find FacultyCourses";
        }

        // Second check: If the faculty has any class at the same time and date
        ps = con.prepareStatement("SELECT COUNT(*) as rowcount FROM facourses WHERE Day=? AND Time=? AND FacultyCourses=?");
        ps.setInt(1, day);
        ps.setInt(2, time);
        ps.setInt(3, facultyCourses);
        rs = ps.executeQuery();

        rs.next();
        count = rs.getInt("rowCount");
        rs.close();
        if(count > 0) {
            con.close();
            return "You have classes at that time of that day.";
        }

        // Finally -> insert into facourses
        ps = con.prepareStatement("INSERT INTO facourses(FacultyCourses, CourseID, Section, Day, Time, Seat, ActiveStatus) VALUES(?,?,?,?,?,?,?)");
        ps.setInt(1,facultyCourses);
        ps.setInt(2, courseID);
        ps.setInt(3, section);
        ps.setInt(4, day);
        ps.setInt(5, time);
        ps.setInt(6, totalSeat);
        ps.setInt(7,1);
        int isDone = ps.executeUpdate();
        con.close();
        if(isDone == 1) return "Insertion Successful.";
        else return "Insertion Failed.";
    }
}
