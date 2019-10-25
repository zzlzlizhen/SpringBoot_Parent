package com.zsm;

public class SwitchDemo1 {
    public static void main(String[] args){
        test1(null);
    }
    public static void test1(String str){
        switch (str){
            case "adb":
                System.out.println("abc");
                break;
            case "bcd":
                System.out.println("bcd");
                break;
            case "null":
                System.out.println("null");
                break;
            default:
                System.out.println("default");
        }
    }
}
