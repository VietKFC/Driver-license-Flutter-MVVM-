import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "original_title")
  final String originalTitle;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  @JsonKey(name: "overview")
  final String overview;
  @JsonKey(name: "popularity")
  final double popularity;
  @JsonKey(name: "poster_path")
  String posterPath;
  @JsonKey(name: "vote_average")
  final double voteAverage;

  Movie(this.id, this.originalTitle, this.originalLanguage, this.overview,
      this.popularity, this.posterPath, this.voteAverage);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  toJson() => _$MovieToJson(this);
}
