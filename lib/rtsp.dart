import 'package:json_annotation/json_annotation.dart';
part 'rtsp.g.dart';

@JsonSerializable()
class RTSP {
  const RTSP({required this.name, required this.url, this.frameRate = 20});

  final String url;
  final String name;

  @JsonKey(defaultValue: 20)
  final int frameRate;

  factory RTSP.fromJson(Map<String, dynamic> json) => _$RTSPFromJson(json);

  Map<String, dynamic> toJson() => _$RTSPToJson(this);
}
