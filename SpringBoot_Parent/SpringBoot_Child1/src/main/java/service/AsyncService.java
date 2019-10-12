package service;

import java.util.concurrent.Future;

public interface AsyncService {
	public Future<String> doTask1() throws Exception;
	public Future<String> doTask2() throws Exception;
	public Future<String> doTask3() throws Exception;
}
