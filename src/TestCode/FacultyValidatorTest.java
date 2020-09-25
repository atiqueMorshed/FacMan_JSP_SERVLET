package TestCode;

import Model.Database.DBConnect;
import Model.Registration.FacultyValidator;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class FacultyValidatorTest {

    FacultyValidator fv;
    @BeforeEach
    void setUp() {
        fv = new FacultyValidator(new DBConnect(), "faculty1@gmail.com", "FAO","password");
    }

    @Test
    void testValidate() throws SQLException {
        assertEquals("[Registration Successful]", fv.validate());
    }
}