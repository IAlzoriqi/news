// import 'dart:convert';
//
// import 'package:news/models/news_model.dart';
// import 'package:http/http.dart' as http;
//
// class ApiGet {
//   List<String> category = [
//     'general',
//     'business',
//     'entertainment',
//     'health',
//     'science',
//     'sports',
//     'technology',
//   ];
//   Future<NewsModel> getdata() async {
//     String url =
//         'http://api.mediastack.com/v1/news?access_key=2a1085d36be262ef91826756ce186f60&limit=100&offset0&categories=${category[0]}';
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       print('response is ${response}');
//       final body = json.decode(response.body);
//       // print('body is ${body}');
//       return NewsModel.fromJson(body);
//     } else {
//       print('errorr noot 200');
//       throw Exception('Failed to load jobs from API');
//     }
//   }
// }
