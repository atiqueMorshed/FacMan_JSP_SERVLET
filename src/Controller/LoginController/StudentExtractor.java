package Controller.LoginController;

import Controller.LoginController.Extractor;
import Model.Database.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/4/2020.
 */
public class StudentExtractor implements Extractor {

    @Override
    public String extractName(String email) throws SQLException {
        String name = "Error From StudentExractor";
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE StudentEmail=?");
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            name = rs.getString("StudentName");
        }
        rs.close();
        con.close();
        return name;
    }

    public int extractStudentCourses(String email) throws SQLException {
        int StudentCourses = 0;
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE StudentEmail=?");
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            StudentCourses = rs.getInt("StudentCourses");
        }
        rs.close();
        con.close();
        return StudentCourses;
    }
    public String extractDOB(String email) throws SQLException {
        String dob = "";
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE StudentEmail=?");
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            dob = rs.getString("DOB");
        }
        rs.close();
        con.close();
        return dob;
    }

    public String extractPhone(String email) throws SQLException {
        String phone = "";
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE StudentEmail=?");
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            phone = rs.getString("Phone");
        }
        rs.close();
        con.close();
        return phone;
    }
}
