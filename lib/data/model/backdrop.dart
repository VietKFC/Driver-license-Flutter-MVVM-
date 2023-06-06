import 'package:json_annotation/json_annotation.dart';

part 'backdrop.g.dart';

@JsonSerializable()
class Backdrop {
  @JsonKey(name: "file_path")
  String filePath;

  Backdrop(this.filePath);

  factory Backdrop.fromJson(Map<String, dynamic> json) =>
      _$BackdropFromJson(json);

  toJson() => _$BackdropToJson(this);
}
