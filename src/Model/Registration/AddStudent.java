package Model.Registration;

import Controller.RegistrationController.StudentValidator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/4/2020.
 */
@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        StudentValidator sv = new StudentValidator(email, password);

        try {
            ArrayList<String> al = sv.validate();
            if(al.isEmpty()) {
                request.setAttribute("ESMessage", "Successfully added Student.");
                RequestDispatcher rd = request.getRequestDispatcher("AddStudent.jsp");
                rd.include(request, response);
            }
            else {
                StringBuilder sb = new StringBuilder();
                for(String val: al) {
                    sb.append(val+"\n");
//                    sb.append("\n");
                }
                request.setAttribute("ESMessage", sb.toString());
                RequestDispatcher rd = request.getRequestDispatcher("AddStudent.jsp");
                rd.include(request, response);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
