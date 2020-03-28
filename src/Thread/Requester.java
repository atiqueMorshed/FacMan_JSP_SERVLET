package Thread;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/26/2020.
 */
public class Requester extends HttpServlet {

//    public void doGet(request ,response){
//        request.setAttribute("sqlstmt", "select ABC from ABC");


    public void setString(String s) {
        String msg =s;
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Requester2 r2 = new Requester2();

    }
}
