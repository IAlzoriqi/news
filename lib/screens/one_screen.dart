import 'package:flutter/material.dart';
import 'package:news/providers/data.dart';
import 'package:news/screens/home_screen.dart';
import 'package:provider/provider.dart';

class OneScreen extends StatefulWidget {
  const OneScreen({Key? key}) : super(key: key);

  @override
  _OneScreenState createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen>
    with SingleTickerProviderStateMixin {
  // List<String> category = [
  //   'general',
  //   'business',
  //   'entertainment',
  //   'health',
  //   'science',
  //   'sports',
  //   'technology',
  // ];

  //  List<String> categoryTitle = [
  //   'General',
  //   'Business',
  //   'Entertainment',
  //   'Health',
  //   'Science',
  //   'Sports',
  //   'Technology',
  // ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  var news ;//=// Provider.of<DataProvider>(context);



  tabMaker() {
    List<Tab> tabs = [];
    for (int i = 0; i < news.category1.length; i++) {
      print(news.category1.length);
      print(news.category1[i]);
      tabs.add(
        Tab(
          child: HomeScreen(categoryindex : i,),
        ),

      );
      print('for tabs ');
    }
    return tabs;
  }
  @override
  Widget build(BuildContext context) {
    news = Provider.of<DataProvider>(context);
    tabMaker();



print ('build one screen');


    return Scaffold(
      body: DefaultTabController(
        length: 7,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: TabBar(
              // controller: this._tabController,
              //onTap: _changeTab,
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
              ),
              labelStyle: const TextStyle(
                fontFamily: "Modelica",
              ),
              tabs:
                  //tabMaker(),
                  const [
                Tab(text: "General"),
                Tab(text: "Business"),
                Tab(text: "Entertainment"),
                Tab(text: "Health"),
                Tab(text: "Science"),
                Tab(text: "Sports"),
                Tab(text: "Technology"),
              ],
            ),
          ),
          body: TabBarView(
            // controller: this._tabController,
            physics: const BouncingScrollPhysics(),
            children: tabMaker(),
            // children: [
            //   // HomeScreen(),
            //   // HomeScreen(),
            // ],
            // ListView.builder(
            //   //     scrollDirection: Axis.horizontal,
            //   itemCount: news.dataLength,
            //   itemBuilder: (BuildContext context, int index) {
            //     return news.getdata() != null
            //         ? HomeScreen()
            //         : Text('bla bla');
            //   },
            // ),
            // for (int i = 0; i < category.length; i++)
            //   news.isFetching
            //       ? Center(child: CircularProgressIndicator())
            //       : HomeScreen(
            //           //  category: category[i],
            //           ),
          ),
        ),
      ),
    );
  }
}
