// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      json['id'] as String,
      json['title'] as String,
      json['image'] as String,
      json['duration'] as String,
      json['type'] as String,
      json['url'] as String,
      json['releaseDate'] as String,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'duration': instance.duration,
      'type': instance.type,
      'url': instance.url,
      'releaseDate': instance.releaseDate,
    };
