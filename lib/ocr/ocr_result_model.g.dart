// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OcrResultModel _$OcrResultModelFromJson(Map<String, dynamic> json) =>
    OcrResultModel()
      ..label = json['label'] as String?
      ..confidence = (json['confidence'] as num?)?.toDouble()
      ..points = (json['points'] as List<dynamic>?)
          ?.map((e) => Points.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$OcrResultModelToJson(OcrResultModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'confidence': instance.confidence,
      'points': instance.points?.map((e) => e.toJson()).toList(),
    };

Points _$PointsFromJson(Map<String, dynamic> json) => Points()
  ..x = json['x'] as int?
  ..y = json['y'] as int?;

Map<String, dynamic> _$PointsToJson(Points instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
