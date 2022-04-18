import 'package:flutter/material.dart';
import 'package:news/widgets/custom_text.dart';

class Article extends StatefulWidget {
  Article({
    Key? key,
    required this.title,
    required this.author,
    required this.categoryType,
    required this.image,
  }) : super(key: key);

  final String title;
  final String author;
  final String categoryType;
  final String image;

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/conan.jpg',
                image: widget.image,
                fit: BoxFit.cover,
                height: 180,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomText(
                    title: widget.title,
                    maxLines: 3,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    title: widget.author,
                    color: Colors.grey[400],
                    maxLines: 1,
                  ),
                  CustomText(
                    title: widget.categoryType,
                    color: Colors.green,
                  ),

                ],
              ),
            ),
          ),
          /*
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          )
           */
        ],
      ),
    );
  }
}
