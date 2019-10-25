package com.zsm.array;

import java.lang.reflect.Array;

public class SparseArray {
    public static void main(String[] args){
        /**
         * 创建原始二维数组
         * 创建原始二维数组
         * 创建原始二维数组
         */
        int[][] originalArray = new int[11][11];
        /**
         * 给原始数组赋值
         */
        originalArray[1][2] = 1;
        originalArray[2][3] = 2;
        originalArray[4][5] = 2;
        /**
         * 打印原始二维数组
         */
        for (int i = 0; i < originalArray.length; i++) {
            for(int j = 0; j < originalArray.length; j++){
                System.out.printf("%d\t",originalArray[i][j]);
            }
            System.out.println();
        }
        /**
         * 把原始二维数组变为稀疏数组
         * 查询原始二维数组有几个有效数字
         */
        int sum = 0;
        for (int[] row : originalArray){
            for(int data : row){
                if(data != 0){
                    sum++;
                }
            }
        }
        /**
         * 创建稀疏数组,稀疏数组必定有3列
         */
        int[][] sparseArray = new int[sum + 1][3];
        /**
         * 给稀疏数组赋值,第一行赋值
         */
        sparseArray[0][0] = 11;
        sparseArray[0][1] = 11;
        sparseArray[0][2] = sum;
        /**
         * 给稀疏数组的后几行赋值,遍历二维数组，然后把非0值赋给稀疏数组
         */
        int count = 0;
        for (int i = 0; i < originalArray.length; i++){
            for (int j = 0; j < originalArray.length; j++){
                if (originalArray[i][j] != 0){
                    count++;
                    sparseArray[count][0] = i;
                    sparseArray[count][1] = j;
                    sparseArray[count][2] = originalArray[i][j];
                }
            }
        }
        /**
         * 输出稀疏数组
         */
        for (int i = 0; i < sparseArray.length; i++){
            System.out.printf("%d\t%d\t%d\t\n",sparseArray[i][0],sparseArray[i][1],sparseArray[i][2]);
        }
        /**
         * 将稀疏数组还原为原始的二维数组，还原原始数组二
         */
        int[][] orginalArray2 = new int[sparseArray[0][0]][sparseArray[0][1]];
        /**
         * 输出还原的二维数组
         */
        System.out.println();
        for (int i = 0; i < orginalArray2.length; i++){
            for(int j = 0; j < orginalArray2.length; j++){
                System.out.printf("%d\t",orginalArray2[i][j]);
            }
            System.out.println();
        }
        /**
         * 通过分解稀疏数组把值赋给二维数组
         */
        for (int i = 1; i < sparseArray.length; i++){
            orginalArray2[sparseArray[i][0]][sparseArray[i][1]] = sparseArray[i][2];
        }

        /**
         * 输出还原的二维数组有数据
         */
        System.out.println();
        for (int i = 0; i < orginalArray2.length; i++){
            for(int j = 0; j < orginalArray2.length; j++){
                System.out.printf("%d\t",orginalArray2[i][j]);
            }
            System.out.println();
        }
    }
}
