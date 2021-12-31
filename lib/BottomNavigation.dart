// ignore_for_file: file_names, unused_field, prefer_const_constructors

import 'package:dummy_ai/screens/Message.dart';
import 'package:dummy_ai/screens/account.dart';
import 'package:dummy_ai/screens/home.dart';
import 'package:dummy_ai/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedPage = 0;

  final _pageOptions = [HomePage(), SearchPage(), MessagePage(), accountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.red,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.red,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.message),
            title: Text("Message"),
            selectedColor: Colors.red,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Account"),
            selectedColor: Colors.red,
          ),
        ],
        currentIndex: selectedPage,
        selectedItemColor: Colors.red,
        //unselectedItemColor: Color(0xff000000),
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
