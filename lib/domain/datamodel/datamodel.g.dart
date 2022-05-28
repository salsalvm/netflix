// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datamodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllDatamodel _$AllDatamodelFromJson(Map<String, dynamic> json) => AllDatamodel(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllDatamodelToJson(AllDatamodel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
