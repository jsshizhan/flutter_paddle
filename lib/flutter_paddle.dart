

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_paddle/utils/json_util.dart';

import 'ocr/ocr_result_model.dart';

Map<String, dynamic> convertMap(Map<dynamic, dynamic> map) {
  map.forEach((key, value) {
    if (value is Map) {
      value = convertMap(value);
    }
  });
  return Map<String, dynamic>.from(map);
}

class FlutterPaddle {
  static const MethodChannel _channel = const MethodChannel('flutter_paddle');

  static Future<List<OcrResultModel>> ocr(imagePath) async {
    if(imagePath==""||imagePath==null){
      return Future.value(null);
    }
     String? result = await _channel.invokeMethod<String>("ocr",{"imagePath":imagePath});
     if(result!=null){
       return JsonUtil.getObjectList(jsonDecode(result), (v) => OcrResultModel.fromJson(convertMap(v)))!;
     }
     return Future.value(null);
  }
}
