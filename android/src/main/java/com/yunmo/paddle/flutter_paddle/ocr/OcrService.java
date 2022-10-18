package com.yunmo.paddle.flutter_paddle.ocr;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.os.Build;

import androidx.annotation.RequiresApi;

import com.baidu.ai.edge.core.infer.InferConfig;
import com.baidu.ai.edge.core.infer.InferManager;
import com.baidu.ai.edge.core.ocr.OcrResultModel;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OcrService {
    private static final float CONFIDENCE = 0.3f;

    public static Gson gson = new Gson();

    public static String ocr(Context context,String file){
        try {
            InputStream is = new FileInputStream(new File(file));
            BitmapFactory.Options options = new BitmapFactory.Options();
            Bitmap image = BitmapFactory.decodeStream(is, null, options);
            is.close();
            InferConfig config = new InferConfig(context.getAssets(), "infer");
            InferManager manager = new InferManager(context, config, "");
            List<OcrResultModel> results = manager.ocr(image, CONFIDENCE);
            manager.destroy();
            List<OcrModel> list = convert(results);
            return gson.toJson(list);
        } catch (Exception e) {

        }
        return null;
    }

    public static List<OcrModel> convert(List<OcrResultModel> results){
        List<OcrModel> ocrModels = new ArrayList<>();
        for (OcrResultModel result : results) {
            OcrModel ocrModel = new OcrModel();
            ocrModel.setLabel(result.getLabel());
            ocrModel.setConfidence(result.getConfidence());
            List<OcrModel.Point> points = new ArrayList<>();
            ocrModel.setPoints(points);
            for (Point point : result.getPoints()) {
                OcrModel.Point pointOcr = new OcrModel.Point();
                pointOcr.setX(point.x);
                pointOcr.setY(point.y);
                points.add(pointOcr);
            }
            ocrModels.add(ocrModel);
        }
        return ocrModels;
    }


}
