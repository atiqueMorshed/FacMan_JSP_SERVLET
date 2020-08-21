package Model.Login;

import Controller.LoginController.FacultyCoursesExtractor;
import Controller.LoginController.FacultyExtractor;
import Controller.LoginController.InitialExtractor;
import Controller.LoginController.Validator;

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
@WebServlet("/FacultyLogin")
public class FacultyLogin extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Validator validator = new Validator(2);
        try {
            if(validator.validate(email, password)) {
//                out.println("Worked!");
                HttpSession session = request.getSession();
                FacultyExtractor faex = new FacultyExtractor();
                InitialExtractor inex = new InitialExtractor();
                FacultyCoursesExtractor fcex = new FacultyCoursesExtractor();

                String name = faex.extractName(email);
                String initial = inex.extractInitial(email);
                int FacultyCourses = fcex.extractFC(email);

                session.setAttribute("NAME", name);
                session.setAttribute("FACULTYEMAIL", email);
                session.setAttribute("INITIAL", initial);
                session.setAttribute("FACULTYCOURSES", FacultyCourses);
                session.setAttribute("USER", "2");
                response.sendRedirect("FacultyProfile.jsp");
            } else {
                request.setAttribute("ErrorMsg", "Invalid login information.");
//                out.println("inElse");
                RequestDispatcher rd = request.getRequestDispatcher("FacultyLogin.jsp");
                rd.include(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
