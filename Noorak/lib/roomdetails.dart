// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lastversion/addlight.dart';

class RoomDetail extends StatefulWidget {
  final String roomID;

  const RoomDetail({Key? key, required this.roomID}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _RoomDetail();
}

class _RoomDetail extends State<RoomDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("MyHome"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 127, left: 70),
            child: Container(
              width: 280,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(171, 236, 117, 147),
                image: DecorationImage(
                  image:
                      AssetImage("images/2855009bf094635e8cb1d32c65b7c99b.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 170, horizontal: 108),
                child: Text(
                  'Manual Control',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddLight(roomID: widget.roomID)),
                );
              }),
          Padding(
            padding: EdgeInsets.only(top: 280, left: 70),
            child: Container(
              width: 280,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(171, 32, 88, 170),
                image: DecorationImage(
                  image:
                      AssetImage("images/2855009bf094635e8cb1d32c65b7c99b.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 330, left: 95),
            child: Text(
              'Automation Details',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}