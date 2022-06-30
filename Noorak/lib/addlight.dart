// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class AddLight extends StatefulWidget {
  State<StatefulWidget> createState() => _AddLight();
}

class _AddLight extends State<AddLight> {
  int i =0 ; 
 final DatabaseReference  _dbref= FirebaseDatabase.instance.ref("8HcAT87dasVTkdgBGc7qoUg8LY03/rooms/room1/lights");
  String alias = '';

  void initState(){
    super.initState();

    
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
      body: Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text("Lights",style: TextStyle(
            
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
           SizedBox(height: 10,),
          Padding(padding: EdgeInsets.only(top:170,left:110),
          child:   ElevatedButton(
                      onPressed: () async {
                        final alias = await openDialog();
                        if(alias == null || alias.isEmpty) return;
                        setState(() {
                          this.alias = alias;
                          print(this.alias);
                        });
                        _updateValueON();
                      
                      },
                      // ignore: sort_child_properties_last
                      child: Text("Add Lights ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(horizontal:50),
                          shape: RoundedRectangleBorder(
                            
                              borderRadius: BorderRadius.circular(20)
                              
                              
                              ),
                              
                              
                              ),
                    ) ,
          ),
          
          Padding(padding: EdgeInsets.symmetric(horizontal: 263,vertical:181),
          child: Icon(
            Icons.add,
                color: Colors.white,
                size: 25,
              
          ),
          ),
        

        ]),

    );
  }

    _updateValueON(){
      i++;
    _dbref.update( { "light$i-new": {"alias" : alias}});
    _dbref.child("light$i-new").child("led_status").set("1");
  }

  Future<String?> openDialog() {
      final TextEditingController controller = TextEditingController();

    return showDialog<String>(
    
    context: context, 
    builder: (context)=> AlertDialog(
      title: Text("New Light"),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(hintText: 'Enter your light alias '),
        controller: controller,
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(controller.text),
          child: Text('Submit'))
      ],
      
      
    )
    );
  }

    
}