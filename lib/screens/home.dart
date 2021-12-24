// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, camel_case_types, non_constant_identifier_names, sized_box_for_whitespace, unused_local_variable, prefer_typing_uninitialized_variables, unused_import, unnecessary_import, unnecessary_null_comparison

import 'package:dummy_ai/api/api_service.dart';
import 'package:dummy_ai/constant/Catagory.dart';
import 'package:dummy_ai/constant/VerticleScrollArticles.dart';
import 'package:dummy_ai/model/article_model.dart';
import 'package:dummy_ai/responsiveapp.dart';
import 'package:dummy_ai/screens/Show.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Color> colors = <Color>[
    Colors.red,
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.red,
    Colors.red,
    Colors.orange,
    Colors.orange,
    Colors.green,
    Colors.green,
  ];
  ApiService client = ApiService();
  var ActualHight;
  var ActualWidth;
  var isVisible = true;
  var key2;

  @override
  void initState() {
    // client.getArticle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (width < 768) {
      ActualHight = 60;
      ActualWidth = 150;
    } else if (width > 768 || width < 100) {
      ActualHight = 120;
      ActualWidth = 300;
    } else {
      ActualHight = 120;
      ActualWidth = 400;
    }

    return responsiveApp(
      mobile: Scaffold(
        appBar: AppBar(
          title: Text(
            "Dummy Ai",
            style: TextStyle(fontFamily: "Poppins"),
          ),
          leading: leadingButton(),
          backgroundColor: Colors.red,
          actions: [search_action()],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The speacial news",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Color(0xff160F11),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "only for you !",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Color(0xff160F11),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                sourceTitle(),
                SizedBox(
                  height: 7,
                ),
                CardHoriScroll(),
                SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: isVisible,
                  child: Text(
                    "Recommended you",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Color(0xff160F11),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                // FutureBuilder(
                //     // future: client.getArticle(),
                //     builder: (BuildContext context,
                //         AsyncSnapshot<List<Article>> snapshot) {
                //   if (snapshot.hasData) {
                //     //print(snapshot.toString());
                //     List<Article>? articles = snapshot.data;
                //     return Center(
                //       child: Text("hello"),
                //     );
                //   }
                //   return Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }),
                NewsArticle(),
              ],
            ),
          )),
        ),
      ),

      // only for tab size device
      tab: Scaffold(
        appBar: AppBar(
          title: Text(
            "Dummy Ai",
            style: TextStyle(fontFamily: "Poppins"),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
          leading: leadingButton(),
          actions: [search_action()],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The speacial news",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Color(0xff291919),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "only for you !",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Color(0xffB0B0B0),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                sourceTitle(),
                SizedBox(
                  height: 10,
                ),
                CardHoriScroll(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Recommended you",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Color(0xff160F11),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                NewsArticle(),
              ],
            ),
          )),
        ),
      ),

      // only for desktop size device
      desktop: Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // height: 60,
              width: 300,
              decoration: BoxDecoration(
                  // color: Color(0xffC4C4C4),
                  //  boxShadow: [
                  //   new BoxShadow(
                  //     color: Colors.black,
                  //     blurRadius: 2.0,
                  //   ),
                  // ]
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dummy Ai",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  TextButton.icon(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Home',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  TextButton.icon(
                    icon: Icon(
                      Icons.room_service,
                      color: Color(0xffFFC0C0),
                    ),
                    label: Text(
                      'Service',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Color(0xffFFC0C0),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  TextButton.icon(
                    icon: Icon(
                      Icons.article,
                      color: Color(0xffFFC0C0),
                    ),
                    label: Text(
                      'More Article',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Color(0xffFFC0C0),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  TextButton.icon(
                    icon: Icon(
                      Icons.recommend,
                      color: Color(0xffFFC0C0),
                    ),
                    label: Text(
                      'Recommended',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Color(0xffFFC0C0),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // desk top body part

            Expanded(
              child: Container(
                height: double.infinity,
                // margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(10),
                  //     topRight: Radius.circular(10))
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The speacial news",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xff160F11),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "only for you !",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xffB0B0B0),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      sourceTitle(),
                      SizedBox(
                        height: 10,
                      ),
                      CardHoriScroll(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Recommended you",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xff160F11),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      NewsArticle(),
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  FutureBuilder<List<Article>> NewsArticle() {
    return FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: articles?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticlePage(
                                  article: articles![index],
                                )));
                  },
                  child: Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.red,
                    //     borderRadius:
                    //         BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.symmetric(vertical: 7),
                    // height: 140,
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                                //  color: Colors.blue,
                                height: 140,
                                width: ActualWidth < 768 ? 150 : 300,
                                margin: EdgeInsets.all(7),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                  ),
                                  child: articles![index].urlToImage == null
                                      ? Container()
                                      : Image.network(
                                          //*********************************"urlToImage ******************************************************

                                          articles[index].urlToImage, scale: 1,
                                          height: double.infinity,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                )),
                            Positioned(
                                left: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 2),
                                  color: colors[index],
                                  child: Text(
                                    Trend[index],
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(17))),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 2),
                                margin: EdgeInsets.only(top: 7),
                                child: Text(
                                  articles[index].source.name,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                articles[index].title,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                articles[index].description,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: ActualWidth < 1000 ? 8 : 12,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xff3C3C3C),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      articles[index].author,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 14,
                                  ),
                                  Text(
                                    articles[index].publishedAt,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff3C3C3C),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Row sourceTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Category",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Color(0xff160F11),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "See all",
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  CardHoriScroll() {
    var l;
    return Column(
      children: [
        Container(
          height: ActualHight < 768 ? 60 : 120,
          child: ListView.builder(
              key: key2,
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: ScrollPhysics(),
              itemCount: Catagorys.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: double.infinity,
                  width: 150,
                  child: InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 0,
                      color: Color(0xffD8D8D8),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      child: Center(child: Text(Catagorys[index])),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  IconButton search_action() =>
      IconButton(onPressed: () {}, icon: Icon(Icons.search));
}

class leadingButton extends StatelessWidget {
  const leadingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.menu));
  }
}
