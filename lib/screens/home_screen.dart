// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/providers/data.dart';
import 'package:news/widgets/article_widget.dart';
import 'package:news/widgets/sub_article_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    required this.categoryindex,
  }) : super(key: key);
  int categoryindex;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //int inddata = Provider.of<DataProvider>(context);
  // get index => null;

  /*
  Future<NewsModel> getdata() async {
    String url =
        'http://api.mediastack.com/v1/news?access_key=2a1085d36be262ef91826756ce186f60&limit=100&offset0&categories=${widget.category}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('response is ${response}');
      final body = json.decode(response.body);
      // print('body is ${body}');
      return NewsModel.fromJson(body);
    } else {
      print('errorr noot 200');
      throw Exception('Failed to load jobs from API');
    }
  }
   */

/*
  @override
  void initState() {
    super.initState();
    final data=  Provider.of<DataProvider>(context,listen:false);
    data.getdata(widget.categoryindex);
    print('${data.getNews}');
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    // final data=  Provider.of<DataProvider>(context,listen:false);
    // data.getdata(widget.categoryindex);
    // print('${data.getNews}');
    // });
  }
  */
  @override
  void initState() {
    var news;

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        Future.delayed(Duration.zero, () async {
          news = await Provider.of<DataProvider>(context, listen: false)
              .getdata(widget.categoryindex);
          print(news);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<DataProvider>(
      context,
    );
    print('${news.getNews}');
    return SingleChildScrollView(
      child: Column(
        children: [
          news.isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  padding: const EdgeInsets.all(10),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: news.getNews.dataModel.length,
                  // itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    final data = news.getNews.dataModel[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubArticle(
                              title: data.title!,
                              author: data.author!,
                              category: data.category!,
                              image: data.image!,
                              country: data.country!,
                              description: data.description!,
                              publishedAt: data.published_at!,
                              source: data.source!,
                              url: data.url!,
                            ),
                          ),
                        );
                      },
                      child: Article(
                        title: data.title!,
                        author: data.author!,
                        categoryType: data.category!,
                        image: data.image!,
                      ),
                    );
                  })

          //: CircularProgressIndicator(),
        ],
      ),
    );
  }
}
