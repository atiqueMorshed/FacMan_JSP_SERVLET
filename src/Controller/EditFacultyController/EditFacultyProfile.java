package Controller.EditFacultyController;

import Model.EditFaculty.EditFacValidator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/4/2020.
 */
@WebServlet("/EditFacultyProfile")
public class EditFacultyProfile extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String result = "";
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("FACULTYEMAIL");
//        String email = request.getParameter("email");
        String password = request.getParameter("passwordX");
        String cpassword = request.getParameter("cpasswordX");
        String initial = request.getParameter("initial");
        String name = request.getParameter("name");
        if(!(password.equals(cpassword))) {
            request.setAttribute("ErrorMsg", "Passwords do not match.");
            RequestDispatcher rd = request.getRequestDispatcher("EditFacultyProfile.jsp");
            rd.include(request, response);
        } else {
            EditFacValidator efv = new EditFacValidator(email, initial, name, password);
            try {
                String ErrorMsg = efv.validateInitial();
                result+="\n"+ErrorMsg;
                ErrorMsg = efv.validateNamePass();
                result+="\n"+ErrorMsg;


                request.setAttribute("ErrorMsg", result);
                RequestDispatcher rd = request.getRequestDispatcher("EditFacultyProfile.jsp");
                rd.include(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
