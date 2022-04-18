import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:news/widgets/article_widget.dart';
import 'package:news/widgets/sub_article_screen.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    required this.category,
  }) : super(key: key);
  String category;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: getdata(),
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // print("/n ### ${snapshot.data!.dataModel}");
            print('futruebuilder');
            //  print(snapshot.error);
            //  print(snapshot.data!);
            return Column(
              children: [
                // CategoryTitle(),
                ListView.builder(
                    padding: const EdgeInsets.all(10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.dataModel!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = snapshot.data!.dataModel![index];
                      print(data);
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
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return Center(
              child: Lottie.asset(
                'assets/animations/98143-black-loading.json',
                repeat: true,
              ),
            );
          }
        }),
      ),
    );
  }
}
