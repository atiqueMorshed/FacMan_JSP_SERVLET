package TestCode;

import Model.Database.DBConnect;
import Model.Login.Validator;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

class ValidatorTest {

    Validator v;
    @BeforeEach
    void setUp() {
        v = new Validator(new DBConnect());
    }

    @Test
    void testValidate() throws SQLException {
        assertEquals(true, v.validate("faculty1@gmail.com", "password"));
    }
}