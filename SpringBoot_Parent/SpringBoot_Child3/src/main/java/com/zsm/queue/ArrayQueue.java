package com.zsm.queue;

import java.util.Scanner;

/**
 * 数组模拟实现队列
 * 队列特点：先进先出
 * maxSize-1代表队列已满
 * front=-1 队列头
 * rear=-1 队列尾
 * front = rear 队列为空
 */
public class ArrayQueue {
    private int[] queue;
    private int maxSize;
    private int front;
    private int rear;
    /**
     * 创建构造函数
     */
    public ArrayQueue(int maxSize){
        queue = new int[3];
        this.maxSize = maxSize;
        front = -1;
        rear = -1;
    }
    /**
     * 判断队列是否已满
     */
    public boolean isFull(){
        return queue.length == (maxSize -1);
    }
    /**
     * 判断队列是否为空
     */
    public boolean isEmpty(){
        return front == rear;
    }
    /**
     * 添加队列
     */
    public void addQueue(int n){
        if(isFull()){
            System.out.println("队列数据已满，不能添加");
            return;
        }
        rear++;
        queue[rear] = n;
    }
    /**
     * 取出队列
     */
    public int getQueue(){
        if(isEmpty()){
           throw new RuntimeException("队列没有数据");
        }
        front++;
       return queue[front];
    }
    /**
     * 查看队列头
     */
    public int showHead(){
        if(isEmpty()) {
            throw new RuntimeException("数组为空");
        }
        return queue[front+1];
    }
    /**
     * 查询队列所有数据
     */
    public void listQueue(){
        if(isEmpty()){
            System.out.println("队列没有数据");
        }else {
            for (int i = 0; i < queue.length; i++){
                System.out.printf("queue[%d]:%d\t",i,queue[i]);
            }
        }
    }
}
class QueueDemo{
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入队列的长短");
        int maxSize = scanner.nextInt();
        char key = ' '; //此用于键盘输入
        ArrayQueue arrayQueue = new ArrayQueue(maxSize);
        boolean loop = true;
        while(loop){
            System.out.println("输入a添加一条队列数据");
            System.out.println("输入e退出程序");
            System.out.println("输入g获取队列数据");
            System.out.println("输入s打印队列数据");
            System.out.println("输入h查看队列头数据");
            key = scanner.next().charAt(0);
            switch (key){
                case 'a':
                    System.out.println("请输入要添加的数字");
                    try {
                        int data = scanner.nextInt();
                        arrayQueue.addQueue(data);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;
                case 's':
                    arrayQueue.listQueue();
                    break;
                case 'g':
                    System.out.println(arrayQueue.getQueue());
                    break;
                case 'h':
                    System.out.println(arrayQueue.showHead());
                    break;
                case 'e':
                    loop = false;
                    break;
                default:
                        break;

            }
        }
        System.out.println("成功退出");
    }
}