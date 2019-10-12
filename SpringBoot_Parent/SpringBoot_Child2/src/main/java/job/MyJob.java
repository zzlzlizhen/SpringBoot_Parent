package job;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 任务调度
 * @author zsm
 */
@Component
@EnableScheduling //开启任务调度
public class MyJob {
	@Scheduled(fixedRate = 1000) //每1000毫秒打印一次
	public void run() {
		System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
	}
}
