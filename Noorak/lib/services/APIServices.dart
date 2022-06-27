import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class APIServices
{
  Stream<DatabaseEvent> rooms()
  {
    final FirebaseDatabase db = FirebaseDatabase.instance;
    return db.ref("8HcAT87dasVTkdgBGc7qoUg8LY03").child("rooms").onValue.asBroadcastStream();
  }
}