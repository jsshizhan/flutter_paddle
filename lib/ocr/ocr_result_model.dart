import 'package:json_annotation/json_annotation.dart';

part 'ocr_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OcrResultModel{

  @JsonKey(name: 'label')
  String? label;

  @JsonKey(name: 'confidence')
  double? confidence;

  @JsonKey(name: 'points')
  List<Points>? points;

  OcrResultModel();

  static OcrResultModel fromJson(Map<String, dynamic> srcJson) => _$OcrResultModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OcrResultModelToJson(this);
}


@JsonSerializable(explicitToJson: true)
class Points{

  @JsonKey(name: 'x')
  int? x;

  @JsonKey(name: 'y')
  int? y;

  Points();

  static Points fromJson(Map<String, dynamic> srcJson) => _$PointsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PointsToJson(this);

}


