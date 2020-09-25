package TestCode;

import Model.Database.DBConnect;
import Model.Login.AdminExtractor;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class AdminExtractorTest {
    AdminExtractor ae;
    @BeforeEach
    void setUp() {
        ae = new AdminExtractor(new DBConnect());
    }

    @Test
    void testExtractName() throws SQLException {
        assertEquals("Yager", ae.extractName("admin@gmail.com"));
    }
}