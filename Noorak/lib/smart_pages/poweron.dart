// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lastversion/main.dart';
import 'package:lastversion/screens/reusable_widgets.dart';

class Poweron extends StatefulWidget {
  State<StatefulWidget> createState() => _Poweron();
}

class _Poweron extends State<Poweron> {
  String _selectedTime = "Pick your time ";
  @override
  Widget build(BuildContext context) {
    Future<void> _openTimerPicker(BuildContext context) async {
      final TimeOfDay? t =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (t != null) {
        setState(() {
          _selectedTime = t.format(context);
          print(_selectedTime);
        });
      }
    }

    return Scaffold(
      
      backgroundColor: Color.fromARGB(255, 27, 27, 27),
      appBar: AppBar(
        title: const Text("MyHome"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: 
      
      Stack(
        
        children: [
          
          Padding(
            padding: EdgeInsets.only(left: 30, top: 21),
            child: Text(
              "Notify me after:",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // SizedBox(height: 100),
          Padding(padding: EdgeInsets.only(top:50,left:160,right: 120),
        child:  RawMaterialButton(
              fillColor: Color.fromARGB(255, 228, 193, 220),
              child: Text(
                _selectedTime,
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                _openTimerPicker(context);
              }),
              ),
                Padding(
            padding: EdgeInsets.only(left: 30, top: 110),
            child: Text(
              "Select one room or more :",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
      SizedBox(
        child: Padding(padding: EdgeInsets.only(left: 10, top: 150),
        child:  StreamBuilder(
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
                
                children: List.generate(roomKeys.length, (index) => Rooms(image: "3596801", title: data[roomKeys[index]]['alias'], roomColor: Color.fromARGB(224, 215, 149, 191))),
                
                
                
              );
          }
          catch(_) {
              return ListView(
        children:  [
          SizedBox(
            height: 120,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 150,horizontal: 150),
          child: Icon(
                Icons.meeting_room_sharp,
                color: Colors.white,
                size: 100,
              ),
          
          ),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.symmetric(vertical: 250,horizontal:160 ),
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
        ),
      
            //    Padding(
            //   padding: EdgeInsets.only(top: 230,left: 60,right: 60),
            //   child: Container(
            //     width: 300,
            //     height: 60,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       color: Color.fromARGB(255, 228, 193, 220),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 75, vertical: 245),
            //   child: Text(
            //     'Adams Room',
            //     style: TextStyle(
            //         fontSize: 25,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white),
            //   ),
            // ),
            // ////////////////////////////
            // ///
            // ///
            // ///
            // ///
            //  Padding(
            //   padding: EdgeInsets.only(top: 320,left: 60,right: 60),
            //   child: Container(
            //     width: 300,
            //     height: 60,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       color: Color.fromARGB(255, 228, 193, 220),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: 75, top: 335),
            //   child: Text(
            //     'Kitchen',
            //     style: TextStyle(
            //         fontSize: 25,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white),
            //   ),
            // ),
            // //////////////////////
            // ///
            // ///
            // ////////////////////
            // Padding(
            //   padding: EdgeInsets.only(top: 410,left: 60,right: 60),
            //   child: Container(
            //     width: 300,
            //     height: 60,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       color: Color.fromARGB(255, 228, 193, 220),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: 75, top: 425),
            //   child: Text(
            //     'Living Room',
            //     style: TextStyle(
            //         fontSize: 25,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white),
            //   ),
            // ),
            //  Padding(
            //   padding: EdgeInsets.only(left: 140, top: 510),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       /* Navigator.of(context).push(
            //           MaterialPageRoute(builder: (context) => Register())); */
            //     },
            //     style: ElevatedButton.styleFrom(
            //         minimumSize: Size(150, 40),
            //         primary: Colors.blue,
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20))),
            //     child: Text("Set",
            //         style: TextStyle(
            //             fontSize: 15, letterSpacing: 2, color: Colors.white)),
            //   ),
            //  ),
      ),
       Padding(
            padding: EdgeInsets.symmetric( horizontal:70, vertical: 50),
            child: ElevatedButton(
              onPressed:()async{
                 DatabaseReference  db = FirebaseDatabase.instance.ref("8HcAT87dasVTkdgBGc7qoUg8LY03").child("rooms").child("room1");
                 await db.update({"power-on ": _selectedTime});

              },
              
              
              child: Text("Set")
            ),
         ),
              
        ],
      ),
    );
  }
}