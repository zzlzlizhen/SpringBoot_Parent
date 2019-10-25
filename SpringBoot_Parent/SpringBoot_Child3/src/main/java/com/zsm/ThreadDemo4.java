package com.zsm;

class DemoThread extends Thread{
    @Override
    public void run() {
       for(int i=0; i < 20; i++){
           try {
                Thread.sleep(1000);
           }catch (Exception e){
               e.printStackTrace();
           }
           System.out.println("getId:" + getId() + ",i:" + i);
       }
    }
}
public class ThreadDemo4 {
    public static void main(String[] args){
        new DemoThread().start();
    }
}
