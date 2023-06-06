import 'package:driver_license_test/data/model/backdrop.dart';
import 'package:json_annotation/json_annotation.dart';

part 'backdrop_response.g.dart';

@JsonSerializable()
class BackdropResponse {
  @JsonKey(name: "backdrops")
  final List<Backdrop> backdrops;

  BackdropResponse(this.backdrops);

  factory BackdropResponse.fromJson(Map<String, dynamic> json) =>
      _$BackdropResponseFromJson(json);

  toJson() => _$BackdropResponseToJson(this);
}
