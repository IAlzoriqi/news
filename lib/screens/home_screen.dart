// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';
import 'package:news/models/news_model.dart';
import 'package:news/models/pagination_model.dart';
import 'package:news/providers/data.dart';
import 'package:news/widgets/article_widget.dart';
import 'package:news/widgets/sub_article_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    required this.categoryindex,
  });

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
   DataProvider _dataProvider =new DataProvider();




   String massegErr='';

    NewsModel news= NewsModel(
      dataModel: [],
      paginationModel: PaginationModel(
        count: 0,
        limit: 0,
        offset: 0,
        total: 0
      )
    );//=// Provider.of<DataProvider>(context);

  getdata() async {
    news=await _dataProvider
        .getdata(widget.categoryindex).catchError((sd){


      massegErr="هناك مشكلة ${sd.toString()}";
      NewsModel newodwlreturn=NewsModel(
          dataModel: [],
          paginationModel: PaginationModel(
              count: 0,
              limit: 0,
              offset: 0,
              total: 0
          )
      );


      return newodwlreturn;
    });
    setState(() {
      news=news;
      massegErr=massegErr;


      if(massegErr.isNotEmpty){
        ScaffoldMessenger.of(context).showSnackBar(

            SnackBar(

          content:  Text(massegErr),
          duration: const Duration(seconds: 30),


          //

        ));
      }
    });

  }
  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //  setState(() {()
    getdata();
    // Future.delayed(Duration.zero, () async {
    //   news = await Provider.of<DataProvider>(context, listen: false)
    //       .getdata(widget.categoryindex);
    //
    //   print(news);
      //  });
      // });
   // });
  }

  @override
  Widget build(BuildContext context) {




    // if(news==null)
    // var news = Provider.of<DataProvider>(
    //   context,
    // );
    // print('${news.news[]}');
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                 news.dataModel.isEmpty
                    ? CircularProgressIndicator()
                    : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: news.dataModel.length,
                    // itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      final data = news.dataModel[index];
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
          ),
        )
        );
  }
}
