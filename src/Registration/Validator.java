package Registration;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/4/2020.
 */
public interface Validator {
    public ArrayList<String> validate() throws SQLException;
}
