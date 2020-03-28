package Thread;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/26/2020.
 */
public class Generator extends Thread {
    public Generator() {
        setDaemon(true);

    }
    public void setArray() {
            }
    public String getString(int i) {
        String[] Arr = {"Did you know you can search faculty members by not only names but initial and email as well?", "A faculty member can disable enrolment in their courses temporarily.", "If you don't have an account for this website, please contact your advisor."};
        return Arr[i];
    }
    public void run() {
        String[] Arr = {"Did you know you can search faculty members by not only names but initial and email as well?", "A faculty member can disable enrolment in their courses temporarily.", "If you don't have an account for this website, please contact your advisor."};
        int index = new Random().nextInt(Arr.length);
        Requester r = new Requester();
        String msg = getString(index);
        r.setString(msg);
    }
}
