import 'package:flutter/material.dart';
import 'package:news/widgets/custom_text.dart';
import 'package:intl/intl.dart';

class SubArticle extends StatefulWidget {
  SubArticle({
    Key? key,
    required this.title,
    required this.author,
    required this.description,
    required this.source,
    required this.image,
    required this.category,
    required this.country,
    required this.url,
    required this.publishedAt,
  }) : super(key: key);

  final String title;
  final String author;
  final String description;
  final String source;
  final String image;
  final String category;
  final String country;
  final String url;
  final String publishedAt;

  @override
  State<SubArticle> createState() => _SubArticleState();
}

class _SubArticleState extends State<SubArticle> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/conan.jpg',
                    image: widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                title: widget.title,
                //  "Monarch population soars 4,900 percent since last year in thrilling 2021 western migration",
                fontWeight: FontWeight.bold,
                size: 18.0,
                maxLines: 4,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: widget.author,
                    color: Colors.grey[600],
                    size: 16.0,
                  ),
                  CustomText(
                    title: DateFormat.yMMMMd()
                        .format(DateTime.parse(widget.publishedAt)),
                    color: Colors.grey[600],
                    size: 16.0,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  title: widget.category,
                  color: Colors.green,
                  size: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                height: 1.5,
                size: 18.0,
                maxLines: 50,
                title: widget.description,
              ),
              Row(
                children: [
                  CustomText(
                    title: 'Link:',
                    size: 18,
                  ),
                  Expanded(
                    child: CustomText(
                      title: widget.url,
                      color: Colors.red,
                      size: 16,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: 'Source: ',
                    color: Colors.black87,
                  ),
                  CustomText(
                    title: widget.source,
                    color: Colors.green,
                    size: 16,
                  ),

                  // CustomText(title: 'Country: ',color: Colors.black87,),
                  // CustomText(title: country,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
