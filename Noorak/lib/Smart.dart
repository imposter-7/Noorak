// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SmartPage extends StatefulWidget {
  const SmartPage({key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SmartPageState();
}

class _SmartPageState extends State<SmartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Smart"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        width: double.infinity,
        height: 1000,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Text(
                'Automation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.purple,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 55),
              child: Text(
                'Schedulaed Power-On',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 350, vertical: 55),
              child: Icon(
                Icons.timer,
                color: Colors.white,
                size: 35,
              ),
            ),
            //Box number two :
            //
            Padding(
              padding: EdgeInsets.only(top: 170),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.greenAccent,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 180),
              child: Text(
                'Turn on the switch at sunrise ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 350, vertical: 180),
              child: Icon(
                Icons.brightness_low,
                color: Colors.white,
                size: 35,
              ),
            ),

            //  Box number three sunset

            Padding(
              padding: EdgeInsets.only(top: 290),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 300, left: 20),
                  child: Text(
                    'Turn on the switch at sunset ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 350, vertical: 300),
              child: Icon(
                Icons.brightness_medium_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            //Box number four
            Padding(
              padding: EdgeInsets.only(top: 410),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffFBCCA3),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 420, left: 20),
                  child: Text(
                    'Schdule notificatios ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            /* Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 350),
              child: Text(
                'Schdule notificatios ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ), */
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 350, vertical: 420),
              child: Icon(
                Icons.timer,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}