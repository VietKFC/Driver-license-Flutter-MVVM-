// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Show _$ShowFromJson(Map<String, dynamic> json) => Show(
      json['id'] as String,
      json['title'] as String,
      json['image'] as String,
      json['season'] as String,
      json['type'] as String,
      json['url'] as String,
      json['latestEpisode'] as String,
    );

Map<String, dynamic> _$ShowToJson(Show instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'season': instance.season,
      'type': instance.type,
      'url': instance.url,
      'latestEpisode': instance.latestEpisode,
    };
