package Model.EditFaculty;

import Model.Database.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/5/2020.
 */
public class FacultyDatabaseInfoFinder {
    DBConnect dbct = new DBConnect();
    public int FacultyCoursesFinder(String email) throws SQLException {
        if(dbct != null) {
            return 1;
        }
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM faculty WHERE FacultyEmail=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            int facultyCourses = rs.getInt("FacultyCourses");
            rs.close();
            con.close();
            return facultyCourses;
        }

        return -1;
    }

    public String ActiveStatusFinder(int a) {
        if(a==0) return "NO";
        else return "YES";
    }



    public String dayFinder(int a) {
        String day;
        if(a == 1) day="SUN-TUE";
        else if(a == 2) day="MON-WED";
        else if(a == 3) day="SAT-THU";
        else day="NOT FOUND";
        return day;
    }
    public String timeFinder(int a) {
        String time;
        if(a == 8) time="8.00-9.20AM";
        else if(a == 9) time="9.30-10.50AM";
        else if(a == 11) time="11.00-12.20PM";
        else if(a == 12) time="12.30-1.50PM";
        else if(a == 2) time="02.00-3.20PM";
        else time="NOT FOUND";
        return time;
    }
    public void deleteRowDatabase(int id) throws SQLException {
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        PreparedStatement ps = con.prepareStatement("DELETE FROM facourses WHERE FCID=?");
        ps.setInt(1, id);
        ps.executeUpdate();
        con.close();
    }

    public void changeActiveStatus(int id) throws SQLException {
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM facourses WHERE FCID=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        int currentStatus = 0;
        int changedStatus;
        if(rs.next()) {
            currentStatus = rs.getInt("ActiveStatus");
        }
        rs.close();

        if(currentStatus==0) changedStatus=1;
        else changedStatus=0;
        ps = con.prepareStatement("UPDATE facourses SET ActiveStatus=? WHERE FCID=?");
        ps.setInt(1, changedStatus);
        ps.setInt(2, id);
        ps.executeUpdate();
        con.close();
    }
}
