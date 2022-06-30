import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart' show FlutterSwitch;
import 'package:lastversion/roomdetails.dart';
import 'main.dart';

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
      body: StreamBuilder(
        stream: apiServices.rooms(),
        builder: (BuildContext context, AsyncSnapshot snapshot)
        {
          if(!snapshot.hasData)
          {
            return const Center(child: CircularProgressIndicator(),);
          }
          // final Map data = snapshot.data.snapshot.value;
          
           try{
              final Map data = snapshot.data.snapshot.value;
              final List roomKeys = data.keys.toList();
               
              return ListView(
                // crossAxisCount: 2,
                children: List.generate(roomKeys.length, (index) => Room(image: "kitchen", title:data[roomKeys[index]]['alias'].toString(), roomColor: Colors.pink, onToggle: () {},)),
              );
          }
     catch(_) {
       return ListView(
        children: const [
          SizedBox(
            height: 120,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 150),
          child: Icon(
                Icons.meeting_room_sharp,
                color: Colors.white,
                size: 100,
              ),
          
          ),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.symmetric(vertical: 0,horizontal:160 ),
          child :Text("No rooms yet...",
          textAlign:TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          )
          ),
          SizedBox(height: 10,),

        ],
      );

          }
        },
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
      height: 130,
      child: Stack(
        children: [
           GestureDetector(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: AssetImage("images/${widget.image}.jpg"),
                  fit: BoxFit.cover,
                  color: widget.roomColor,
                  colorBlendMode: BlendMode.darken,
                  height: 120,
                  width: double.infinity,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoomDetail()),
              );
            },
          ),
      

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              widget.title.toString().toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
                  
            ),
            
          ),
          FlutterSwitch(
              width: 50,
              height: 25,
              valueFontSize: 35.0,
              toggleSize: 50.0,
              value: _switchValue,
              borderRadius: 30.0,
              onToggle: (value) {
                setState(() {
                  _switchValue = value;
                });

                widget.onToggle();
              },
            ),
        ],
      ),
    );
    
  }
}
