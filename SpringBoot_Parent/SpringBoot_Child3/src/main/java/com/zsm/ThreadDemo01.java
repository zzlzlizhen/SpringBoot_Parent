package com.zsm;

/**
 * 什么是进程？
 * 进程其实就是一个应用程序，进程是所有线程集合
 * 什么是线程？
 * 线程是一条执行路径，main 主线程，如果是自己创建线程 子线程
 * gc线程， 专门回收垃圾
 */
public class ThreadDemo01 {
    public static void main(String[] args){
        System.out.println("mainThread");
    }
}
