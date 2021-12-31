// ignore_for_file: prefer_const_constructors, file_names, unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Notification",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            color: Colors.pink,
                            size: 20,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Add New",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            Column(
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                          backgroundColor: Colors.transparent,
                        ),
                        title: Text(
                          "Manoj tivari",
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text("BBC News"),
                        trailing: Icon(Icons.more_vert_outlined),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
