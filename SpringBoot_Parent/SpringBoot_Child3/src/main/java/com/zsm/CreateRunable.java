package com.zsm;

public class CreateRunable implements Runnable{
    @Override
    public void run() {
        for(int i= 0; i < 20; i++){
            System.out.println("run()i:" + i);
        }
    }
}
class ThreadDemo3{
    public static void main(String[] args){
        System.out.println("main主线程执行开始");
        CreateRunable createRunable = new CreateRunable();
        Thread thread = new Thread(createRunable);
        thread.start();
        System.out.println("thread线程开始执行");
        for(int i= 0; i < 20; i++){
            System.out.println("main()i:" + i);
        }
    }
}
