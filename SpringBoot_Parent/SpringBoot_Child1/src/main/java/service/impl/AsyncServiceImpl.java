package service.impl;

import java.util.Random;
import java.util.concurrent.Future;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;

import service.AsyncService;


@Service
public class AsyncServiceImpl implements AsyncService {
	private Random random = new Random();
	/**
	 * 此注解意思是启动一个异步线程执行此任务
	 */
	@Async
	@Override
	public Future<String> doTask1() throws Exception {
		long start = System.currentTimeMillis();
		Thread.sleep(random.nextInt(10000));
		long end = System.currentTimeMillis();
		System.out.println("任务一结束时间为"+ (end - start) + "毫秒");
		return new AsyncResult<String>("任务一结束");
	}
	@Async
	@Override
	public Future<String> doTask2() throws Exception{
		long start = System.currentTimeMillis();
		Thread.sleep(random.nextInt(10000));
		long end = System.currentTimeMillis();
		System.out.println("任务二结束时间为"+ (end -start) + "毫秒");
		return new AsyncResult<String>("任务二结束");
	}
	@Async
	@Override
	public Future<String> doTask3() throws Exception{
		long start = System.currentTimeMillis();
		Thread.sleep(random.nextInt(10000));
		long end = System.currentTimeMillis();
		System.out.println("任务三结束时间为"+ (end - start) + "毫秒");
		return new AsyncResult<String>("任务三结束");
	}

}
