import 'package:json_annotation/json_annotation.dart';

part 'movie_watch_list_request.g.dart';

@JsonSerializable()
class MovieWatchListRequest {
  @JsonKey(name: "media_type")
  final String mediaType;
  @JsonKey(name: "media_id")
  final int mediaId;
  @JsonKey(name: "watchlist")
  final bool isWatchList;

  MovieWatchListRequest(this.mediaType, this.mediaId, this.isWatchList);

  factory MovieWatchListRequest.fromJson(Map<String, dynamic> json) =>
      _$MovieWatchListRequestFromJson(json);

  toJson() => _$MovieWatchListRequestToJson(this);
}
