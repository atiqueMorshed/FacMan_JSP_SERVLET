package Controller.LoginController;

import java.sql.SQLException;

/**
 * Created by [Atique Morshed Sami] [17101076] on 3/4/2020.
 */
public interface Extractor {
    public String extractName(String email) throws SQLException;
}
