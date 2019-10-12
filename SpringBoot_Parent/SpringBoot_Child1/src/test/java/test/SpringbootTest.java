package test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import controller.SpringBootController;
import junit.framework.TestCase;

@SpringBootTest(classes = SpringBootController.class)
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class SpringbootTest {
	@Autowired
	private SpringBootController sbc;
	@Test
	public void test1() {
		TestCase.assertEquals(this.sbc.yes(), "yes");
	}
}
