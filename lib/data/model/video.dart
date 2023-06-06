import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "key")
  final String key;
  bool isSelected = false;

  Video(this.name, this.key);

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  toJson() => _$VideoToJson(this);
}
