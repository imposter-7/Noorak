// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lastversion/Home.dart';
import 'package:lastversion/Smart.dart';
import 'package:lastversion/mainpage.dart';
import 'package:lastversion/notifications/notification_api.dart';
import 'package:lastversion/profile.dart';
import 'package:lastversion/realtime_db.dart';
import 'package:lastversion/roomdetails.dart';
import 'package:lastversion/notifications/notifications.dart';
import 'package:lastversion/services/APIServices.dart';
import 'package:lastversion/smart_pages/poweron.dart';
import 'package:lastversion/smart_pages/sunset.dart';

final APIServices apiServices = APIServices();

//import 'package:responsive_framework/responsive_framework.dart';

//sethompage back the defult but now test the smart page
//import 'Home.dart';

// void main() {
//   runApp(const MaterialApp(home: MainPage()));
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  runApp(MaterialApp(

    // home: realtime_db(),
    // home: MainPage(),
    // home: MainScreen(),
    home: Profile(),
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,

      title: 'Home',
supportedLocales: [
    Locale('en', 'US'), // English, no country code
    Locale('ar', 'JO'), // Spanish, no country code
  ],
      home: MainPage(),

    
    );
    
  }
}
