import 'package:json_annotation/json_annotation.dart';

part 'show.g.dart';

@JsonSerializable()
class Show {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "season")
  final String season;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "latestEpisode")
  final String latestEpisode;

  Show(this.id, this.title, this.image, this.season, this.type, this.url,
      this.latestEpisode);

  factory Show.fromJson(Map<String, dynamic> map) => _$ShowFromJson(map);

  toJson() => _$ShowToJson(this);
}
