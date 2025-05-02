import 'package:json_annotation/json_annotation.dart';

part 'anniversary_model.g.dart';

@JsonSerializable()
class AnniversaryModel {
  final int id;
  final String title;
  final DateTime date;

  AnniversaryModel({
    required this.id,
    required this.title,
    required this.date,
  });

  factory AnniversaryModel.fromJson(Map<String, dynamic> json) =>
      _$AnniversaryModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnniversaryModelToJson(this);
}
