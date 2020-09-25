package TestCode;

import Model.Database.DBConnect;
import Model.Login.InitialExtractor;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class InitialExtractorTest {

    InitialExtractor ie;
    @BeforeEach
    void setUp() {
        ie = new InitialExtractor(new DBConnect());
    }

    @Test
    void testExtractInitial() throws SQLException {
        assertEquals("FAO", ie.extractInitial("faculty1@gmail.com"));
    }
}