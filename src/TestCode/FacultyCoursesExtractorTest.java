package TestCode;

import Model.Database.DBConnect;
import Model.Login.FacultyCoursesExtractor;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class FacultyCoursesExtractorTest {
    FacultyCoursesExtractor fce;
    @BeforeEach
    void setUp() {
        fce = new FacultyCoursesExtractor(new DBConnect());
    }

    @Test
    void extractFC() throws SQLException {
        assertEquals(7, fce.extractFC("faculty1@gmail.com"));
    }
}