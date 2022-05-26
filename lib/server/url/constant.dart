import 'package:netflix/infrastructure/api_key.dart';

const kBaseUrl = "https://api.themoviedb.org/3";
const imageAppentUrl = "https://image.tmdb.org/t/p/w500/";
const baseUrl = "https://api.themoviedb.org/3";

class ApiEndPoints {
  static const downloadUrl = "$kBaseUrl/trending/all/day?api_key=$apiKey";
}
