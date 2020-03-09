package Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/4/2020.
 */
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Validator validator = new Validator(3);
        try {
            if(validator.validate(email, password)) {
//                out.println("Worked!");
                HttpSession session = request.getSession();
                StudentExtractor stex = new StudentExtractor();

                String name = stex.extractName(email);
                int StudentCourses = stex.extractStudentCourses(email);
                String dob = stex.extractDOB(email);
                String phone = stex.extractPhone(email);

                session.setAttribute("NAME", name);
                session.setAttribute("STUDENTEMAIL", email);
                session.setAttribute("STUDENTCOURSES", StudentCourses);
                session.setAttribute("DOB", dob);
                session.setAttribute("PHONE", phone);
                session.setAttribute("USER", "3");
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("ErrorMsg", "Invalid login information.");
//                out.println("inElse");
                RequestDispatcher rd = request.getRequestDispatcher("StudentLogin.jsp");
                rd.include(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
