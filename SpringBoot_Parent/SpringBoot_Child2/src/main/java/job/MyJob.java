package job;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * �������
 * @author zsm
 */
@Component
@EnableScheduling //定时
public class MyJob {
	@Scheduled(fixedRate = 1000)
	public void run() {
		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
	}
}
