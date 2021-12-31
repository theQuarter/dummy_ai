// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, no_logic_in_create_state, avoid_print, non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, unnecessary_null_comparison

import 'package:carousel_slider/carousel_slider.dart';
//import 'package:dummy_ai/constant/Catagory.dart';
import 'package:dummy_ai/model/article_model.dart';
import 'package:flutter/material.dart';

import 'package:dummy_ai/responsiveapp.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

final items = [
  'https://static.toiimg.com/thumb/67087192/kol-sweet-shops.jpg?width=1200&height=900',
];

class ArticlePage extends StatefulWidget {
  final Article article;

  const ArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  String VideoUrl =
      "https://res.cloudinary.com/kirankumar/video/upload/c_scale,h_720/v1639482593/Unknown_9__Awakening_-_Official_Teaser_Trailer_ocasay.mp4";
  int _current = 0;
  bool _isVisible = false;
  bool _isPlayerVisible = false;
  String quality = "720";
  bool _isArrowVisible = true;

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  final CarouselController _controllers = CarouselController();
  @override
  void initState() {
    if (kIsWeb) {
      _isArrowVisible = true;
    } else {
      _isArrowVisible = false;
    }
    items.clear();
    items.insert(0, widget.article.urlToImage);
    items.add(
        "https://cdn.pixabay.com/photo/2016/06/07/01/49/ice-cream-1440830_1280.jpg");
    items.add(
        "https://cdn.pixabay.com/photo/2017/12/27/07/07/brownie-3042106_1280.jpg");
    items.add(
        "https://cdn.pixabay.com/photo/2018/02/25/07/15/food-3179853_1280.jpg");

    //print(widget.article.urlToImage);

    videoUrlReplace(quality);

    _controller = VideoPlayerController.network(VideoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    //print(" Video Url $VideoUrl");
    super.initState();
  }

  videoUrlReplace(String qualities) {
    setState(() {
      String OneVideoUrl = VideoUrl.replaceAll(
          "https://res.cloudinary.com/kirankumar/video/upload/c_scale,h_", "");
      String secondVideoUrl = OneVideoUrl.replaceAll(
          "/v1639482593/Unknown_9__Awakening_-_Official_Teaser_Trailer_ocasay.mp4",
          "");
      VideoUrl = VideoUrl.replaceAll(secondVideoUrl, qualities);
      print(VideoUrl);
    });
    return VideoUrl;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                      icon: Icon(Icons.arrow_back_outlined),
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
                child: ImageSlide(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column ImageSlide(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              height: 350,
              width: double.infinity,
              child: CarouselSlider.builder(
                carouselController: _controllers,
                itemCount: items.length,
                itemBuilder: (context, index, realIndex) {
                  // future builder

                  return Container(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      // ignore: unnecessary_null_comparison
                      child: _current == 3
                          ?

                          //future nuilder video plaer
                          FutureBuilder(
                              future: _initializeVideoPlayerFuture,
                              builder: (context, snapshot) {
                                //  print(quality);
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            )
                          // ? Image: Add image to this list

                          : widget.article.urlToImage == null
                              ? Container()
                              : Image.network(
                                  //*********************************"urlToImage ******************************************************
                                  items[index],
                                  height: 350,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: items.asMap().entries.map((entry) {
                    // print(_current);
                    if (_current == 3) {
                      _isVisible = true;
                    } else {
                      _isVisible = false;
                    }
                    return GestureDetector(
                      onTap: () => _controllers.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  icon: Icon(_controller.value.isPlaying
                      ? Icons.pause_circle
                      : Icons.play_circle_outlined),
                  color: Colors.white,
                  iconSize: 42.0,
                ),
              ),
            ),
            Visibility(
              visible: _isVisible,
              child: Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              //  shape: BoxShape.circle,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8))),
                          height: 400,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      quality = "180";
                                      videoUrlReplace(quality);

                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "180",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: quality == "180"
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                    onPressed: () {
                                      quality = "240";
                                      videoUrlReplace(quality);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "240",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: quality == "240"
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                    onPressed: () {
                                      quality = "360";
                                      videoUrlReplace(quality);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "360",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: quality == "360"
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                    onPressed: () {
                                      quality = "480";
                                      videoUrlReplace(quality);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "480",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: quality == "480"
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                    onPressed: () {
                                      quality = "720";
                                      videoUrlReplace(quality);
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "720",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: quality == "720"
                                            ? Colors.red
                                            : Colors.black,
                                      ),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.more_vert_outlined),
                  color: Colors.white,
                  iconSize: 28.0,
                ),
              ),
            ),
            Visibility(
              visible: _isArrowVisible,
              child: Positioned(
                  left: 15,
                  child: IconButton(
                      onPressed: () => _controllers.previousPage(
                          duration: Duration(milliseconds: 500)),
                      icon: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: Colors.white,
                        size: 40,
                      ))),
            ),
            Visibility(
              visible: _isArrowVisible,
              child: Positioned(
                  right: 15,
                  child: IconButton(
                      onPressed: () => _controllers.nextPage(
                          duration: Duration(milliseconds: 500)),
                      icon: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.white,
                        size: 40,
                      ))),
            ),
          ],
        ),

        // row change
        // image view

        NewsTitle(),
        author(),
        article(),
      ],
    );
  }

  Container article() {
    return Container(
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
    );
  }

  Container author() {
    return Container(
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
    );
  }

  Container NewsTitle() {
    return Container(
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
    );
  }

  Scaffold MobileTab() {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Article"),
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined),
          //Icons.arrow_left_sharp,
          color: Colors.white,
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {

        //     },
        //     icon: Icon(Icons.class__outlined),
        //     //Icons.arrow_left_sharp,
        //     color: Colors.white,
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ImageSlide(context),
            ),
            // NewsTitle(),
            //author(),
            // article(),
          ],
        ),
      ),
    );
  }
}
