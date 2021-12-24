// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, no_logic_in_create_state, avoid_print, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:dummy_ai/model/article_model.dart';
import 'package:flutter/material.dart';

import 'package:dummy_ai/responsiveapp.dart';

class ArticlePage extends StatefulWidget {
  final Article article;

  const ArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  void initState() {
    super.initState();
    print(widget.article.urlToImage);
  }

  @override
  Widget build(BuildContext context) {
    return responsiveApp(
      mobile: MobileTab(),
      // ignore: prefer_const_constructors
      tab: MobileTab(),
      desktop: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 4),
                color: Colors.red,
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_left),
                      //Icons.arrow_left_sharp,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "News Article",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 200, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                        // ignore: unnecessary_null_comparison
                        child: widget.article.urlToImage == null
                            ? Container()
                            : Image.network(
                                //*********************************"urlToImage ******************************************************
                                widget.article.urlToImage,
                                height: 350,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        widget.article.title,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(17))),
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                        margin: EdgeInsets.only(top: 7),
                        child: Text(
                          widget.article.author,
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        widget.article.content,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Scaffold MobileTab() {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Article"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                // ignore: unnecessary_null_comparison
                child: widget.article.urlToImage == null
                    ? Container()
                    : Image.network(
                        //*********************************"urlToImage ******************************************************
                        widget.article.urlToImage,
                        height: 350,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                widget.article.title,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(17))),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                margin: EdgeInsets.only(top: 7),
                child: Text(
                  widget.article.author,
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                widget.article.content,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
