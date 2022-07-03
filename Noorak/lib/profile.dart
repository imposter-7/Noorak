// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:lastversion/notifications/notification_api.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  bool ispassword = true;
  var _switchValue = false;

  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();
  }
  

  Future<int> getTime() async{
  final DatabaseReference  db = FirebaseDatabase.instance.ref("2bp6lKoRrbN9C3Vva9OMIwllgXv2").child("rooms").child('room1');
      final DatabaseEvent event = await db.once();
    final Map data = event.snapshot.value as Map;
    return data['scheduled-notifications'];
  }

  Future<int> get_ledStatus() async{
    final DatabaseReference  db = FirebaseDatabase.instance.ref("2bp6lKoRrbN9C3Vva9OMIwllgXv2").child("rooms").child('room1').child("lights").child("562bcd60-fa58-11ec-bcfd-6d8041811005");
    final DatabaseEvent event = await db.once();
    final Map data = event.snapshot.value as Map;
    // print(data['led_status']);
    return data['led_status'];
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                  child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.blue.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/kitchen.jpg'),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 100, top: 80),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 4, color: Colors.white),
                        color: Colors.orange,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 150,
                    ),
                    child: Text(
                      "The name ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 190,
                    ),
                    child: Text(
                      " Email@gmail.com",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )),
              /*SizedBox(height: 50),
                buildTextField("Full Name", "Raghad", false),
              buildTextField("Email", "ragood.200024@gmail.com", false),
              buildTextField("Password", "********", true), */
              //SizedBox(height: 30),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 118),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text("Edit Profile",
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              color: Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 70,
                    ),
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   child:
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Container(
                      width: 400,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff575353),
                      ),
                    ),
                  ),
                  // onTap: () async{
                  //     int seconds = await getTime() ;
                  //     print(seconds);
                  //     print("hahaha");
                  //     NotificationService().showNotification(1, "NOORAK",
                  //     "Warning: Lights are on !  ",2  );
                  // },
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 115,
                      left: 300,
                    ),
                    child: FlutterSwitch(
                      width: 50,
                      height: 25,
                      valueFontSize: 25.0,
                      toggleSize: 45.0,
                      value: _switchValue,
                      borderRadius: 30.0,
                      onToggle: (value) async{
                            int seconds = await getTime() ;
                            // print(seconds);
                            // print("hahaha");
                            int led_status = await get_ledStatus();
                            print(led_status);
                            if(value == true && led_status ==1 )
                           {
                            
                             NotificationService().showNotification(1, "NOORAK",
                            "Warning: Lights are on !  ",2  );
                           }
                        
                              setState(() {
                                _switchValue = value;
                              });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 113,
                    ),
                    child: Text(
                      'Turn on Notifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 170,
                    ),
                    child: Text(
                      'Locations',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: Container(
                      width: 400,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff575353),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 208,
                      left: 320,
                    ),
                    child: Icon(
                      Icons.add_location,
                      size: 40,
                      color: Colors.orange,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 215,
                    ),
                    child: Text(
                      'Set your Location',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 260,
                    ),
                    child: Text(
                      'Report',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 280, left: 50),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          padding: EdgeInsets.symmetric(horizontal: 70),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text("Check your report",
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 2,
                              color: Colors.white)),
                    ),
                  ),
                  /* Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 350, vertical: 55),
                    child: Icon(
                      Icons.timer,
                      color: Colors.white,
                      size: 35,
                    ),
                  ), */

                  /* ElevatedButton(
                    onPressed: () {},
                    child: Text("Save",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        padding: EdgeInsets.symmetric(horizontal: 70),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ) */
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  /*  Widget buildTextField(String labelText, String placeholder, bool isPassword) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPassword ? true : false,
        decoration: InputDecoration(
            suffixIcon: ispassword
                ? IconButton(
                    icon: Icon(Icons.edit, color: Colors.white),
                    onPressed: () {})
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white, fontSize: 18),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
    );
    } */
}
