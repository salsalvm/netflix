
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/server/datamodel/datamodel.dart';
import 'package:netflix/server/datamodel/result.dart';

abstract class ApiCall {
  Future getTrending();
}


class DataBase extends ApiCall {
 
  @override
  Future<List<Result>> getTrending() async {
    final _result = await http.get(Uri.parse("https://api.themoviedb.org/3/trending/all/day?api_key=40346cd872033d5628c1c89a31dc8329"));

  
      final _resultJson = jsonDecode(_result.body) as Map<String,dynamic>;
      final response = AllDatamodel.fromJson(_resultJson);
      return response.results;
   
  }
}
// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:netflix/server/datamodel/datamodel.dart';
// import 'package:netflix/server/datamodel/result.dart';

// abstract class ApiCall {
//   Future<List<Result>> getTrending();
// }

// final dio = Dio();

// class DataBase extends ApiCall {
 
//   @override
//   Future<List<Result>> getTrending() async {
//     final _result = await dio.get("https://api.themoviedb.org/3/trending/all/day?api_key=40346cd872033d5628c1c89a31dc8329");

//     if (_result.data != null) {
//       final _resultJson = jsonDecode(_result.data) as Map<String,dynamic>;
//       final getNotResponce = AllDatamodel.fromJson(_resultJson);
//       return getNotResponce.results;
//     } else {
//       return [];
//     }
//   }
// }