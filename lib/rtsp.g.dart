// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rtsp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RTSP _$RTSPFromJson(Map<String, dynamic> json) => RTSP(
      name: json['name'] as String,
      url: json['url'] as String,
      frameRate: json['frameRate'] as int? ?? 20,
    );

Map<String, dynamic> _$RTSPToJson(RTSP instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'frameRate': instance.frameRate,
    };
