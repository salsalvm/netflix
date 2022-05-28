import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/domain/datamodel/datamodel.dart';
import 'package:netflix/domain/datamodel/result.dart';
import 'package:netflix/domain/url/constant.dart';
import 'package:netflix/infrastructure/api_key.dart';

abstract class ApiCall {
  Future getNowPlaying();
  Future getTrending();
  Future getPopular();
  Future getLatestMovies();
  Future getSearchResult(search);
  Future getUpComing();
  Future getTop10();
}

class DataBase extends ApiCall {
  @override
  Future<List<Result>> getTrending() async {
    final _result = await http.get(Uri.parse(
        "$kBaseUrl/trending/all/day?api_key=$apiKey"));

    final _resultJson = jsonDecode(_result.body) as Map<String, dynamic>;
    final response = AllDatamodel.fromJson(_resultJson);
    return response.results;
  }

  @override
  Future getPopular() async {
    final _result = await http.get(Uri.parse(
        "$kBaseUrl/movie/popular?api_key=$apiKey&language=en-US&page=1"));
    final _resultJson = jsonDecode(_result.body) as Map<String, dynamic>;
    final response = AllDatamodel.fromJson(_resultJson);
    return response.results;
  }

  @override
  Future getLatestMovies() async {
    final _result = await http.get(Uri.parse(
        "$kBaseUrl/trending/all/day?api_key=$apiKey"));

    final _resultJson = jsonDecode(_result.body) as Map<String, dynamic>;
    final response = AllDatamodel.fromJson(_resultJson);
    return response.results;
  }

  @override
  Future getSearchResult(search) async {
    final _result = await http.get(Uri.parse(
        "$kBaseUrl/search/movie?api_key=$apiKey&query=$search"));

    final _resultJson = jsonDecode(_result.body) as Map<String, dynamic>;
    final response = AllDatamodel.fromJson(_resultJson);
    return response.results;
  }

  @override
  Future getUpComing() async {
    final _result = await http.get(Uri.parse(
        "$kBaseUrl/movie/upcoming?api_key=$apiKey&language=en-US&page=1"));
    final _resultJson = jsonDecode(_result.body) as Map<String, dynamic>;
    final response = AllDatamodel.fromJson(_resultJson);
    return response.results;
  }

  @override
  Future getNowPlaying() async {
    final _result = await http.get(Uri.parse(
        "$kBaseUrl/movie/now_playing?api_key=$apiKey&language=en-US&page=1"));
    final _resultJson = jsonDecode(_result.body) as Map<String, dynamic>;
    final response = AllDatamodel.fromJson(_resultJson);
    return response.results;
  }

  @override
  Future getTop10() async {
    final _result = await http.get(Uri.parse(
        "$kBaseUrl/movie/top_rated?api_key=$apiKey&language=en-US&page=1"));
    final _resultJson = jsonDecode(_result.body) as Map<String, dynamic>;
    final response = AllDatamodel.fromJson(_resultJson);
    return response.results;
  }
}
