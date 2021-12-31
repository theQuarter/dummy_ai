// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Search bar"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ),
    );
  }
}
