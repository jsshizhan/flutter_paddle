package com.yunmo.paddle.flutter_paddle.ocr;

import android.content.Context;

import java.util.Random;

import io.flutter.plugin.common.MethodChannel;

public class OcrThread implements Runnable{

    private Context context;
    private String filePath;
    private MethodChannel.Result result;

    public void setContext(Context context){
        this.context = context;
    }

    public void setFilePath(String filePath){
        this.filePath = filePath;
    }

    public void setResult(MethodChannel.Result result){
        this.result = result;
    }

    @Override
    public void run() {
        result.success(OcrService.ocr(context,filePath));
    }
}
