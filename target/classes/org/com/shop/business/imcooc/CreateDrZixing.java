package org.com.shop.business.imcooc;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import java.io.File;
import java.nio.file.Path;
import java.util.HashMap;

/**
 * Created by Administrator on 2017/1/11 0011.
 */
public class CreateDrZixing {
    public static void main(String[] args){
        int width = 200;
        int height = 200;
        String format = "png";
        String content = "云帆加速WiFi密码：YunFan@2017.net";

        //定义二维码参数
        HashMap hints = new HashMap();
        hints.put(EncodeHintType.CHARACTER_SET,"utf-8");
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
        hints.put(EncodeHintType.MARGIN,2);

        //生成二维码
        try{
            BitMatrix bitMatrix =  new MultiFormatWriter().encode(content, BarcodeFormat.AZTEC.QR_CODE,width,height,hints);
            Path file = new File("D:/code/img.png").toPath();
            MatrixToImageWriter.writeToPath(bitMatrix,format,file);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
