package Controller.LoginControllers;

import Model.Login.AdminExtractor;
import Model.Login.Validator;

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
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Validator validator = new Validator(1);
        try {
            if(validator.validate(email, password)) {
//                out.println("Worked!");
                HttpSession session = request.getSession();
                AdminExtractor adex = new AdminExtractor();

                String name = adex.extractName(email);
                session.setAttribute("NAME", name);
                session.setAttribute("ADMINEMAIL", email);
                session.setAttribute("USER", "1");
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("ErrorMsg", "Invalid login information.");
//                out.println("inElse");
                RequestDispatcher rd = request.getRequestDispatcher("AdminLogin.jsp");
                rd.include(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
