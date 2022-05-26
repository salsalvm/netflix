import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'overview')
  String? overView;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'title')
  String? title;
  bool? video;
  @JsonKey(name: 'media_type')
  String? mediaType;

  Result({
    this.releaseDate,
    this.id,
    this.backdropPath,
    this.posterPath,
    this.title,
    this.video,
    this.mediaType,
  });
  Result.get({
    required this.releaseDate,
    required this.id,
    required this.backdropPath,
    required this.posterPath,
    required this.title,
    required this.video,
    required this.mediaType,
  });
  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
