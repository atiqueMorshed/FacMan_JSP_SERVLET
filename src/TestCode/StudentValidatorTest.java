package TestCode;

import Model.Database.DBConnect;
import Model.Registration.FacultyValidator;
import Model.Registration.StudentValidator;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class StudentValidatorTest {

    StudentValidator sv;
    @BeforeEach
    void setUp() {
        sv = new StudentValidator(new DBConnect(), "student1@gmail.com", "password");
    }

    @Test
    void testValidate() throws SQLException {
        assertEquals("[Registration Successful]", sv.validate());
    }
}