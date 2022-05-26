import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'datamodel.g.dart';

@JsonSerializable()
class AllDatamodel {
  @JsonKey(name: 'results')
  List<Result> results;

  AllDatamodel({this.results = const []});

  factory AllDatamodel.fromJson(Map<String, dynamic> json) {
    return _$AllDatamodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AllDatamodelToJson(this);
}
