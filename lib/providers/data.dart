import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/models/data_model.dart';
import 'package:news/models/news_model.dart';
import 'package:news/models/pagination_model.dart';
import 'package:news/service/service.dart';
import 'package:http/http.dart' as http;

class DataProvider with ChangeNotifier {
  late NewsModel _newsm;
// NewsModel get getnew => _newsm;
  // List<NewsModel> _news = [];
  NewsModel get getNews => _newsm;

  // List<DataModel> _data = [];
  // List<DataModel> get getDataModel => [..._data];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final List<String> _category = const [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology'
  ];
  List<String> get category1 => _category;

  Future<NewsModel> getdata(int indexcat) async {
    print('get data');
    String url =
        'http://api.mediastack.com/v1/news?access_key=2a1085d36be262ef91826756ce186f60&'
        'limit=100&offset0&categories=${_category[indexcat]}';
    final response = await http.get(Uri.parse(url));
    print('reaponse statuscode' "${response.statusCode}");
    if (response.statusCode == 200) {
      print('response is ${response}');
      final body = json.decode(response.body);
      print('body is ${body}');
      _newsm = NewsModel.fromJson(body);
      _isLoading = false;
      notifyListeners();
      print(_newsm);

      return _newsm;
    } else {
      print('errorr noot 200');
      throw Exception('Failed to load jobs from API');
    }
  }
}
