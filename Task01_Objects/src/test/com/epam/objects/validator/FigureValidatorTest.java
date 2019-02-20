package test.com.epam.objects.validator;

import com.epam.objects.validator.FigureValidator;
import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@SuppressWarnings("CheckStyle")
public class FigureValidatorTest {
    private List<String> data;
    private FigureValidator validator;

    @BeforeTest
    private void init() {
        validator = new FigureValidator();
        data = new ArrayList<>(Arrays.asList("1 2 3", "ad", "2", "23gfd", "3"));
    }


    @Test(description = "Positive script when of string validation")
    public void testValidate() {
        List<String> expected = new ArrayList<>(Arrays.asList("1 2 3", "2",
                "3"));
        List<String> actual = validator.validate(data);
        Assert.assertEquals(actual, expected);
    }
}