import 'package:driver_license_test/data/model/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_list_response.g.dart';

@JsonSerializable()
class BaseListResponse {
  @JsonKey(name: "page")
  final int page;
  @JsonKey(name: "results")
  final List<dynamic> data;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  BaseListResponse(this.page, this.data, this.totalPages, this.totalResults);

  List<Movie> mapToListMovies() {
    final List<Movie> movies = [];
    for (var element in data) {
      movies.add(Movie.fromJson(element));
    }
    return movies;
  }

  factory BaseListResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseListResponseFromJson(json);

  toJson() => _$BaseListResponseToJson(this);
}
