import 'package:flutter/material.dart';
import 'package:news/screens/home_screen.dart';

class OneScreen extends StatefulWidget {
  const OneScreen({Key? key}) : super(key: key);

  @override
  _OneScreenState createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: category.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _changeTab(int selectedIndex) {
    if (selectedIndex >= 0) _tabController.animateTo(selectedIndex);
  }
  List<String> category = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];

  List<String> categoryTitle=[
    'General',
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: DefaultTabController(
        length: category.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: TabBar(
              controller: _tabController,
              onTap: _changeTab,
              isScrollable: true,
              physics: BouncingScrollPhysics(),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black,
              ),
              labelStyle: TextStyle(
                fontFamily: "Modelica",
              ),
              tabs: [
               for(int i=0 ; i<categoryTitle.length; i++)
                Tab(text: categoryTitle[i]),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            physics: BouncingScrollPhysics(),
            children: [
              for(int i =0 ;i < category.length ; i++)
           HomeScreen(category: category[i],),
            ],
          ),
        ),
      ),
    );
  }
}
