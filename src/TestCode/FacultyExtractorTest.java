package TestCode;

import Model.Database.DBConnect;
import Model.Login.FacultyExtractor;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class FacultyExtractorTest {

    FacultyExtractor fe;
    @BeforeEach
    void setUp() {
        fe = new FacultyExtractor(new DBConnect());
    }

    @Test
    void testExtractName() throws SQLException {
        assertEquals("Faculty One", fe.extractName("faculty1@gmail.com"));
    }
}