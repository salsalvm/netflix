// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      releaseDate: json['release_date'] as String?,
      id: json['id'] as int?,
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      mediaType: json['media_type'] as String?,
    )..overView = json['overview'] as String?;

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'overview': instance.overView,
      'release_date': instance.releaseDate,
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'title': instance.title,
      'video': instance.video,
      'media_type': instance.mediaType,
    };
