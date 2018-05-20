package org.com.shop.business.single;

/**
 * Created by Administrator on 2017/2/17 0017.
 */
public class Single {
    //1.构造函数私有化
    private Single(){

    }
    //2,构造函数私有化以后外界不能调用，然后创建类的唯一实例,使用private static 修饰
     private static Single instance = new Single();

    //3,提供一个获取实例的方法，使用public static修饰
   public static Single getInstance(){
        return instance;
    }
}
