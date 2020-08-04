package EditStudent;

import Database.DBConnect;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static java.lang.Integer.parseInt;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/9/2020.
 */
@WebServlet("/AddStudentCourse2")
public class AddStudentCourse2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        int CourseID = parseInt(request.getParameter("CourseIDDropdown"));
        int Section = parseInt(request.getParameter("CourseSectionDropdown"));
        int StudentCourses = parseInt(request.getParameter("StudentCourses"));
        DBConnect dbc = new DBConnect();
        Connection con = dbc.getConnection();
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("SELECT * FROM stcourses WHERE StudentCourses=? AND CourseID=?");
            ps.setInt(1,StudentCourses);
            ps.setInt(2,CourseID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                rs.close();
                con.close();
                request.setAttribute("ErrorMsg","You already have taken this course.");
                RequestDispatcher rd = request.getRequestDispatcher("AddStudentCourse.jsp");
                rd.include(request, response);
            } else {
                ps = con.prepareStatement("SELECT * FROM facourses WHERE CourseID=? AND Section=?");
                ps.setInt(1,CourseID);
                ps.setInt(2,Section);
                rs = ps.executeQuery();
                if(rs.next()) {
                    int FCID = rs.getInt("FCID");
                    int TotalStudents = rs.getInt("TotalStudents");
                    int Seat = rs.getInt("Seat");
                    ps = con.prepareStatement("SELECT * FROM student WHERE StudentCourses=?");
                    ps.setInt(1, StudentCourses);
                    rs = ps.executeQuery();
                    rs.next();
                    int courseTaken = rs.getInt("CourseTaken");
                    if (courseTaken < 4) {
                        courseTaken++;
                        if(TotalStudents < Seat) {
                            TotalStudents++;
                            ps = con.prepareStatement("UPDATE facourses SET TotalStudents= ? WHERE FCID=?");
                            ps.setInt(1, TotalStudents);
                            ps.setInt(2, FCID);
                            ps.executeUpdate();

                            ps = con.prepareStatement("INSERT INTO stcourses(StudentCourses, CourseID, Section, FCID) VALUES(?, ?, ?, ?)");
                            ps.setInt(1, StudentCourses);
                            ps.setInt(2, CourseID);
                            ps.setInt(3, Section);
                            ps.setInt(4, FCID);
                            ps.executeUpdate();

                            ps = con.prepareStatement("UPDATE student SET CourseTaken= ? WHERE StudentCourses=?");
                            ps.setInt(1, courseTaken);
                            ps.setInt(2, StudentCourses);
                            ps.executeUpdate();

                            rs.close();
                            con.close();
                            request.setAttribute("ErrorMsg","Course added.");
                            RequestDispatcher rd = request.getRequestDispatcher("AddStudentCourse.jsp");
                            rd.include(request, response);
                        }

                    } else {
                        rs.close();
                        con.close();
                        request.setAttribute("ErrorMsg","You already have taken 4 courses or course seat full.");
                        RequestDispatcher rd = request.getRequestDispatcher("AddStudentCourse.jsp");
                        rd.include(request, response);
                    }


                }
                else{
                    rs.close();
                    con.close();
                    request.setAttribute("ErrorMsg","Course/Section not found.");
                    RequestDispatcher rd = request.getRequestDispatcher("AddStudentCourse.jsp");
                    rd.include(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
