package TestCode;

import Model.Database.DBConnect;
import Model.Login.StudentExtractor;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class StudentExtractorTest {

    StudentExtractor se;
    @BeforeEach
    void setUp() {
        se = new StudentExtractor(new DBConnect());
    }

    @Test
    void testExtractName() throws SQLException {
        assertEquals("Student One", se.extractName("faculty1@gmail.com"));
    }

    @Test
    void testExtractStudentCourses() throws SQLException {
        assertEquals(9, se.extractStudentCourses("faculty1@gmail.com"));
    }

    @Test
    void testExtractDOB() throws SQLException {
        assertEquals("1999-12-09", se.extractDOB("faculty1@gmail.com"));
    }

    @Test
    void testExtractPhone() throws SQLException {
        assertEquals("+8801765431433", se.extractPhone("faculty1@gmail.com"));
    }
}