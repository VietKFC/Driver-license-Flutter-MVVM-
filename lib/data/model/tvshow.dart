import 'package:json_annotation/json_annotation.dart';

part 'tvshow.g.dart';

@JsonSerializable()
class TvShow {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "original_name")
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

  TvShow(this.id, this.originalTitle, this.originalLanguage, this.overview,
      this.popularity, this.posterPath, this.voteAverage);

  factory TvShow.fromJson(Map<String, dynamic> json) => _$TvShowFromJson(json);

  toJson() => _$TvShowToJson(this);
}
