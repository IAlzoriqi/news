import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/models/data_model.dart';
import 'package:news/models/news_model.dart';
import 'package:news/service/service.dart';
import 'package:http/http.dart' as http;

class DataProvider with ChangeNotifier {
 final List<NewsModel> _news = [];
  List<NewsModel> get getNews => [..._news];
final  List<DataModel> _data =[];
  List<DataModel> get getDataModel =>[..._data];
  bool _isFetching = false;
  bool get isFetching => _isFetching;
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

  int get dataLength {
    return _data.length;
  }

  Future<NewsModel> getdata() async {
    _isFetching = true;
    notifyListeners();
    String url =
        'http://api.mediastack.com/v1/news?access_key=2a1085d36be262ef91826756ce186f60&'
        'limit=100&offset0&categories=general';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('response is $response');
      final body = json.decode(response.body);
      print('body is ${body}');
      return NewsModel.fromJson(body);
    } else {
      print('errorr noot 200');
      throw Exception('Failed to load jobs from API');
    }
  }
}
