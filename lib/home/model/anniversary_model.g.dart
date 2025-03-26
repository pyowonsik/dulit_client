// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anniversary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnniversaryModel _$AnniversaryModelFromJson(Map<String, dynamic> json) =>
    AnniversaryModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$AnniversaryModelToJson(AnniversaryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date.toIso8601String(),
    };
