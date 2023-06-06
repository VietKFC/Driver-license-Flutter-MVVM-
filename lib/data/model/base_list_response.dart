import 'package:driver_license_test/data/model/movie.dart';
import 'package:driver_license_test/data/model/tvshow.dart';
import 'package:driver_license_test/data/model/video.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_list_response.g.dart';

@JsonSerializable()
class BaseListResponse {
  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "results")
  final List<dynamic> data;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "total_results")
  final int? totalResults;

  BaseListResponse(this.page, this.data, this.totalPages, this.totalResults);

  List<Movie> mapToListMovies() {
    final List<Movie> movies = [];
    for (var element in data) {
      movies.add(Movie.fromJson(element));
    }
    return movies;
  }

  List<Video> mapToListVideos() {
    final List<Video> videos = [];
    for (var element in data) {
      videos.add(Video.fromJson(element));
    }
    return videos;
  }

  List<TvShow> mapToListTvShows() {
    final List<TvShow> tvShows = [];
    for (var element in data) {
      tvShows.add(TvShow.fromJson(element));
    }
    return tvShows;
  }

  factory BaseListResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseListResponseFromJson(json);

  toJson() => _$BaseListResponseToJson(this);
}
