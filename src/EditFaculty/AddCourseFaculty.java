package EditFaculty;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import static java.lang.Integer.parseInt;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/5/2020.
 */
@WebServlet("/AddCourseFaculty")
public class AddCourseFaculty extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String result = "";
        HttpSession session = request.getSession();
        String email = session.getAttribute("FACULTYEMAIL").toString();
        int courseID = parseInt(request.getParameter("courseID"));
        int section = parseInt(request.getParameter("section"));
        int day = parseInt(request.getParameter("day"));
        int time = parseInt(request.getParameter("time"));
        int totalSeat = parseInt(request.getParameter("totalSeat"));

        if(courseID == 0 || section == 0 || day == 0 || time == 0 || totalSeat == 0) {
            request.setAttribute("ErrorMsg", "Select an option.");
            RequestDispatcher rd = request.getRequestDispatcher("AddCourseFaculty.jsp");
            rd.include(request, response);
        }
        else {
            AddCourseValidator acv = new AddCourseValidator(courseID, section, day, time, totalSeat, email);
            try {
                result = acv.validate();
                request.setAttribute("ErrorMsg", result);
                RequestDispatcher rd = request.getRequestDispatcher("AddCourseFaculty.jsp");
                rd.include(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
