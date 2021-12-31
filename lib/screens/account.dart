// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';

class accountPage extends StatefulWidget {
  @override
  _accountPageState createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.more_vert_outlined,
                      color: Colors.pink,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // color: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://images.hindustantimes.com/img/2021/12/13/550x309/ANI-20211212125-0_1639321422576_1639411726938.jpg',
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Text(
                                  'rahul mohoja',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Text(
                                  'rahul@vebsigns.com',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF95A1AC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: IconButton(
                              //borderColor: Colors.transparent,
                              // borderRadius: 30,
                              // buttonSize: 46,
                              icon: Icon(
                                Icons.chat_bubble,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'Chat',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: IconButton(
                              //borderColor: Colors.transparent,
                              // borderRadius: 30,
                              // buttonSize: 46,
                              icon: Icon(
                                Icons.videocam_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'Video Call',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: IconButton(
                              // borderColor: Colors.transparent,
                              // borderRadius: 30,
                              //  buttonSize: 46,
                              icon: Icon(
                                Icons.call_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'Call',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: IconButton(
                              // borderColor: Colors.transparent,
                              // borderRadius: 30,
                              // buttonSize: 46,
                              icon: Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'Follow',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 2,
                indent: 16,
                endIndent: 16,
                color: Color(0x250D9BF1),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 0, 8),
                          child: Text(
                            'Company',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            child: Text(
                              'Flutterflow',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 0, 8),
                          child: Text(
                            'User Bio',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            child: Text(
                              'I have a proven track record of working with clients, coming up with project briefs, solving existing problems and offering solutions that increase revenue & user engagement. My focus is in Product & User Experience Design, I have worked on over 120 projects over the last 8 years.',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 0, 8),
                          child: Text(
                            'Local Time',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            child: Text(
                              '4:20pm',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 0, 8),
                          child: Text(
                            'Address',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            child: Text(
                              '1492 West Sential Way, \nSan Mateo CA 928101',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
