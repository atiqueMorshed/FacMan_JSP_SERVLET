package TestCode;

import Model.Database.DBConnect;
import Model.EditFaculty.AddCourseValidator;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

class AddCourseValidatorTest {

    AddCourseValidator addCourseValidator;
    DBConnect dbc;

    @BeforeEach
    void setUp() {
        dbc = new DBConnect();
        addCourseValidator = new AddCourseValidator(dbc, 470, 02, 1, 8, 25, "faculty1@gmail.com");
    }

    @Test
    public void testValidate() throws SQLException {
//        when(dbc.getConnectionT()).thenReturn("Insertion Successful.");
        assertEquals("Insertion Successful.", addCourseValidator.validate());
    }
}