import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_paddle/flutter_paddle.dart';
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:flutter_paddle/ocr/ocr_result_model.dart';
import 'package:flutter_paddle/utils/json_util.dart';
import 'package:image_picker/image_picker.dart';

Map<String, dynamic> convertMap(Map<dynamic, dynamic> map) {
  map.forEach((key, value) {
    if (value is Map) {
      value = convertMap(value);
    }
  });
  return Map<String, dynamic>.from(map);
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<OcrResultModel>? _result;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState(imagePath) async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    List<OcrResultModel>? result = await FlutterPaddle.ocr(imagePath);
    if(result!=null){
      // Map<String,dynamic> data = jsonDecode(result.toString());
      // List<OcrResultModel>? list = JsonUtil.getObjectList(result,(v) => OcrResultModel.fromJson(convertMap(v)));
      setState(() {
        _result = result;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: ()async{
                final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
                initPlatformState(pickedFile?.path);
              }, child: Text("??????")),
              Column(
                children: _result==null?[Text("")]:_result!.map((e) => Text("?????????${e.label}???????????????${e.confidence}")).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
