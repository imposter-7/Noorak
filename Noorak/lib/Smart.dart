import 'package:flutter/material.dart';
// import 'package:lastversion/bottomnavbar.dart';
// import 'package:lastversion/profile.dart';
import 'package:lastversion/smart_pages/poweroff.dart';
import 'package:lastversion/smart_pages/poweron.dart';
import 'package:lastversion/smart_pages/schedulenotification.dart';
import 'package:lastversion/smart_pages/sunrise.dart';
import 'package:lastversion/smart_pages/sunset.dart';

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
      body: 
      SingleChildScrollView(
        
      child: 
      SizedBox(
        // width: double.infinity,
        height: 700.0,
        child: Stack(
          children: [
          const  Padding(
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
        GestureDetector(
          child:  Padding(
              padding:const EdgeInsets.only(top: 50),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.purple,
                ),
              ),
            ),
             onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Poweron()),
              );
            },
        ),
           const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 55),
              child: Text(
                'Scheduled Power-On',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 350, vertical: 55),
              child: Icon(
                Icons.timer,
                color: Colors.white,
                size: 35,
              ),
            ),
            //Box number two :
            //
         GestureDetector(
           child: Padding(
              padding: const EdgeInsets.only(top: 170),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color:const Color.fromARGB(232, 105, 184, 240),
                ),
              ),
            ),
             onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sunrise()),
              );
            },
         ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 180),
              child: Text(
                'Turn off the switch at sunrise ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          const  Padding(
              padding: EdgeInsets.symmetric(horizontal: 350, vertical: 180),
              child: Icon(
                Icons.brightness_low,
                color: Colors.white,
                size: 35,
              ),
            ),

            //  Box number three sunset
          GestureDetector(
            child :
            Padding(
              padding:const EdgeInsets.only(top: 290),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(218, 140, 218, 178),
                ),
              ),
            ),
             onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SunSet()),
              );
            },
          ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 300, left: 20),
                  child: const Text(
                    'Turn on the switch at sunset ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),

           const Padding(
              padding: EdgeInsets.symmetric(horizontal: 350, vertical: 300),
              child: Icon(
                Icons.brightness_medium_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            //Box number four

          GestureDetector(
            child:
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
             onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            },
          ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 420, left: 20),
                  child: const Text(
                    'Scheduled Notifications ',
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 350, vertical: 420),
              child: Icon(
                Icons.timer,
                color: Colors.white,
                size: 35,
              ),
            ),
            ////////////////
            ////
            ///
            ///
          GestureDetector(
            child:
          Padding(
              padding: EdgeInsets.only(top: 530),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 218, 210, 219),
                ),
              ),
            ),
             onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Poweroff()),
              );
            },
          ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 540),
              child: Text(
                'Scheduled Power-off',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 350, top: 540),
              child: Icon(
                Icons.timer,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
          
        ),
      ),)
      // ,bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}