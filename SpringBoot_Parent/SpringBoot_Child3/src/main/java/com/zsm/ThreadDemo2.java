package com.zsm;

/**
 * 启动一个线程
 */
public class ThreadDemo2 {
    public static void main(String[] args){
        System.out.println("线程启动开始");
        //定义一个类，继承thread类，重写run方法
        //如何启动线程
        CreateThread createThread = new CreateThread();
//        createThread.run();
        createThread.start();
        System.out.println("线程启动开始 main");

        for(int i= 0; i < 20; i++){
            System.out.println("main()i:" + i);
        }
    }
}

/**
 * 创建一个线程
 */
class CreateThread extends Thread{
    /**
     * run方法执行需要的线程执行的任务，代码
     */
    @Override
    public void run() {
        for(int i= 0; i < 20; i++){
            System.out.println("run()i:" + i);
        }
    }
}