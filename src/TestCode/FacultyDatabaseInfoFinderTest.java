package TestCode;

import Model.Database.DBConnect;
import Model.EditFaculty.FacultyDatabaseInfoFinder;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class FacultyDatabaseInfoFinderTest {

    FacultyDatabaseInfoFinder fdif;
    @BeforeEach
    void setUp() {
        fdif = new FacultyDatabaseInfoFinder();
    }

    @Test
    void testFacultyCoursesFinder() throws SQLException {
        assertEquals(1, fdif.FacultyCoursesFinder("faculty1@gmail.com"));
    }

    @Test
    void textActiveStatusFinder() {
        assertEquals("YES", fdif.ActiveStatusFinder(1));
    }

    @Test
    void testDayFinder() {
        assertEquals("SAT-THU", fdif.dayFinder(3));
    }

    @Test
    void testTimeFinder() {
        assertEquals("12.30-1.50PM", fdif.timeFinder(12));
    }
}