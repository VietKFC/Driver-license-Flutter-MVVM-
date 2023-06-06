import 'package:json_annotation/json_annotation.dart';

part 'base_response_post.g.dart';

@JsonSerializable()
class BaseResponsePost {
  @JsonKey(name: "success")
  final bool isSuccess;
  @JsonKey(name: "status_message")
  final String statusMessage;

  BaseResponsePost(this.isSuccess, this.statusMessage);

  factory BaseResponsePost.fromJson(Map<String, dynamic> json) =>
      _$BaseResponsePostFromJson(json);

  toJson() => _$BaseResponsePostToJson(this);
}
