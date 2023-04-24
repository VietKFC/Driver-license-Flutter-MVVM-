import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "duration")
  final String duration;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "releaseDate")
  final String releaseDate;

  Movie(this.id, this.title, this.image, this.duration, this.type, this.url,
      this.releaseDate);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  toJson() => _$MovieToJson(this);
}
