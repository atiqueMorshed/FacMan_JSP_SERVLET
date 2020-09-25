package TestCode;

import Model.Database.DBConnect;
import Model.EditFaculty.EditFacValidator;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class EditFacValidatorTest {

    EditFacValidator editFacValidator;
    DBConnect dbc;

    @BeforeEach
    void setUp() {
        dbc = new DBConnect();
        editFacValidator = new EditFacValidator(dbc, "faculty1@gmail.com", "FAO", "Faculty One", "password");
    }

    @Test
    void testValidateInitial() throws SQLException {
        assertEquals("Initial Updated.", editFacValidator.validateInitial());
    }

    @Test
    void testValidateNamePass() throws SQLException {
        assertEquals("Name Updated.\nPassword Updated.", editFacValidator.validateNamePass());
    }
}