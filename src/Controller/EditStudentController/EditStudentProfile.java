package Controller.EditStudentController;


import Model.EditStudent.EditStudentValidator;

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
 * Created by [Atique Morshed Sami] [17101076] on 3/26/2020.
 */
@WebServlet("/EditStudentProfile")
public class EditStudentProfile extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String result = "";
        HttpSession session = request.getSession();
        String email = (String)session.getAttribute("STUDENTEMAIL");
        String password = request.getParameter("passwordX");
        String cpassword = request.getParameter("cpasswordX");
        String dob = request.getParameter("dob");
        String phone = request.getParameter("phone");
        String name = request.getParameter("name");
        if(!(password.equals(cpassword))) {
            request.setAttribute("ErrorMsg", "Passwords do not match.");
            RequestDispatcher rd = request.getRequestDispatcher("EditStudentProfile.jsp");
            rd.include(request, response);
        } else {
            EditStudentValidator esv = new EditStudentValidator(email, phone, dob, name, password);
            try {
                String ErrorMsg = esv.validatePhone();
                result+="\n"+ErrorMsg;
                ErrorMsg = esv.validateNamePass();
                result+="\n"+ErrorMsg;


                request.setAttribute("ErrorMsg", result);
                RequestDispatcher rd = request.getRequestDispatcher("EditStudentProfile.jsp");
                rd.include(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
