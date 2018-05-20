package org.com.shop.business.single;

/**
 * Created by Administrator on 2017/2/17 0017.
 */
public class singleTest {
    public static void main(String[] args){
        Single s1 = Single.getInstance();
        Single s2 = Single.getInstance();
        if(s1==s2){
            System.out.print("s1和s2是相等的");
        }else {
            System.out.print("s1和s2是不相等的");
        }
    }
}
