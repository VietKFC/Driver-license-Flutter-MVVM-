import 'package:driver_license_test/data/model/production_company.dart';
import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';

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
  @JsonKey(name: "backdrop_path")
  String backdropPath;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  @JsonKey(name: "production_companies")
  final List<ProductionCompany>? companies;
  @JsonKey(name: "genres")
  final List<Genre>? genres;

  Movie(
      this.id,
      this.originalTitle,
      this.originalLanguage,
      this.overview,
      this.popularity,
      this.posterPath,
      this.backdropPath,
      this.releaseDate,
      this.voteAverage,
      this.companies,
      this.genres);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  toJson() => _$MovieToJson(this);
}
