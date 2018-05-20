package intercept;

import java.io.UnsupportedEncodingException;

/**
 * Created by Administrator on 2017/3/14 0014.
 */
public class SubStringByBytes {

    public static void main(String [] args) throws UnsupportedEncodingException {
        String en = "a";
        String cn = "我";
        System.out.println("英文_ISO-8859-1：" + en.getBytes("ISO-8859-1").length);
        System.out.println("汉字_ISO-8859-1：" + cn.getBytes("ISO-8859-1").length);
        System.out.println("英文_GBK：" + en.getBytes("GBK").length);
        System.out.println("汉字_GBK：" + cn.getBytes("GBK").length);
        System.out.println("英文_UTF-8：" + en.getBytes("UTF-8").length);
        System.out.println("汉字_UTF-8：" + cn.getBytes("UTF-8").length);

        String str = "abc我们啊ddd";
        /**
         *  这里还和截取何种编码的字节数有关，如果截取9个字节
         * GBK 是  abc我们啊
         * UTF8是  abc我们
         */

        System.out.println(subStringByBytes(str, 9,"gbk"));
        System.out.println(subStringByBytes(str, 9,"utf-8"));
    }

    /**
     *
     * @param str 要截取的字符串
     * @param bytes 截取的字节数
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String subStringByBytes(String str, int bytes,String charSetName) throws UnsupportedEncodingException {
        String subAfter = str.substring(0, bytes);
        int temp = bytes;
        try {
            //直到截取的字符串的字节数  和   需要的 截取的字节数相等位为止
            while(bytes < subAfter.getBytes(charSetName).length){
                subAfter = subAfter.substring(0,--temp );
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return subAfter;
    }
    /**
     *
     * @return 当前系统的编码格式
     */
    public static String getSystemEncode() {
        System.getProperties().list(System.out);// 得到当前的系统属性。并将属性列表输出到控制台
        String encoding = System.getProperty("file.encoding");
        System.out.println("Encoding:" + encoding);
        return encoding;
    }
}

