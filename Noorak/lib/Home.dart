// ignore: file_names
// ignore_for_file: avoid_print, sized_box_for_whitespace, prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart' show FlutterSwitch;
import 'package:lastversion/bottomnavbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("MyHome"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Room(
            title: "kitchen",
            image: "kitchen",
            onToggle: () => print("kitchen"),
            roomColor: Color.fromARGB(123, 167, 96, 73),
          ),
          Room(
            title: "livingroom",
            image: "livingroom",
            onToggle: () => print("livingroom"),
            roomColor: Colors.blue,
          ),
          Room(
            title: "bedroom",
            image: "bedroom",
            onToggle: () => print("bedroom"),
            roomColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

class Room extends StatefulWidget {
  final String title, image;
  final VoidCallback onToggle;
  final Color roomColor;

  const Room({
    key,
    required this.title,
    required this.image,
    required this.onToggle,
    required this.roomColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  bool _switchValue = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: AssetImage("images/${widget.image}.jpg"),
                fit: BoxFit.cover,
                
                color: widget.roomColor,
                colorBlendMode: BlendMode.darken,
                height: 150,
                width: double.infinity,
              ),
            ),
          ),

          //),
          /*  height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/${widget.image}.jpg"),
                  fit: BoxFit.cover, 
                ),
                borderRadius: BorderRadius.circular(15),
                /* color: widget.roomColor,
                backgroundBlendMode: BlendMode.darken,
                /*  colorBlendMode: BlendMode.darken,
              height: 150,
              width: double.infinity, */ */
              ), */

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              widget.title.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: FlutterSwitch(
              width: 50,
              height: 25,
              valueFontSize: 25.0,
              toggleSize: 45.0,
              value: _switchValue,
              borderRadius: 30.0,
              onToggle: (value) {
                setState(() {
                  _switchValue = value;
                });

                widget.onToggle();
              },
            ),
          ),
        ],
      ),
    );
  }
}
