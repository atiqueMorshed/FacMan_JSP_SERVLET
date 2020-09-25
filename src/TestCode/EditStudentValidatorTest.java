package TestCode;

import Model.Database.DBConnect;
import Model.EditStudent.EditStudentValidator;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class EditStudentValidatorTest {
    EditStudentValidator escv;
    @BeforeEach
    void setUp() {
        escv = new EditStudentValidator(new DBConnect(), "student1@gmail.com", "01789876546", "1999-12-09", "Student One", "password");
    }

    @Test
    void testValidatePhone() throws SQLException {
        assertEquals("Phone Updated.", escv.validatePhone());
    }

    @Test
    void testValidateNamePass() throws SQLException {
        assertEquals("Name Updated.\nPassword Updated.", escv.validateNamePass());
    }
}