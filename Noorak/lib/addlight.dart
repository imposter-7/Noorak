// ignore_for_file: prefer_const_constructors

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lastversion/main.dart';

import 'Home.dart';

class AddLight extends StatefulWidget {
  final String roomID;
  const AddLight({Key? key, required this.roomID}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddLight();
}

class _AddLight extends State<AddLight> {

  @override
  void initState(){
    super.initState();

    
  }

  @override
  void dispose() {
    super.dispose();
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
          onPressed: () {
                        // ignore: unnecessary_null_comparison
                        if(controller.text == null || controller.text.isEmpty) return;
                        apiServices.addLight(controller.text, widget.roomID);
                        Navigator.of(context).pop();
          },
          child: Text('Submit'))
      ],
      
      
    )
    );
  }

  ///////////////
  ///
  ///
  ///
   Future<String?> edit_alias_openDialog(String lightID) {
    final TextEditingController controller = TextEditingController();

    return showDialog<String>(
    
    context: context, 
    builder: (context)=> AlertDialog(
      title: Text("Edit Light Name"),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(hintText: 'Enter new light name '),
        controller: controller,
      ),

      actions: [
        TextButton(
          onPressed: () async {
              if(controller.text == null || controller.text.isEmpty) return;
              await FirebaseDatabase.instance.ref(apiServices.get_UID()).child("rooms").child(widget.roomID).child("lights").child(lightID).update({"alias":controller.text});
              Navigator.of(context).pop();
          },
          child: Text('Submit'))
      ],
      
      
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Lights"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: openDialog, icon: Icon(Icons.add, color: Colors.white,))
        ],
      ),
     body: StreamBuilder(
      stream: apiServices.lights(widget.roomID),
      builder: (BuildContext context, AsyncSnapshot snapshot)
      {
        if(!snapshot.hasData)
        {
          return Center(child: CircularProgressIndicator(color: Colors.white,),);
        }

        try
        {
          final Map data = snapshot.data.snapshot.value;
          final List lightKeys = data.keys.toList();
          return GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          children: List.generate(lightKeys.length, (index) => GestureDetector(
            onTap: () async => await apiServices.toggleLight(widget.roomID, lightKeys[index]),
            child: Column(
              children: [
              Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(data[lightKeys[index]]['alias'], style: TextStyle(color: Colors.white, fontSize: 20,),),
                IconButton(
                  onPressed:()=>
                  // print(lightKeys[index]),
                   apiServices.removeLight(widget.roomID, lightKeys[index].toString().toLowerCase()),
                    icon:  Icon(Icons.delete_sharp,size:30,color: Color.fromARGB(255, 190, 59, 59),)
              ),
              IconButton(
                  onPressed:()async=>
                  // print(lightKeys[index]),
                  //  apiServices.removeLight(widget.roomID, lightKeys[index].toString().toLowerCase()),
                  edit_alias_openDialog(lightKeys[index].toString().toLowerCase()),

                    icon:  Icon(Icons.edit,size:30,color: Color.fromARGB(255, 131, 126, 126),)
              )
                ],
              )
                
              , Flexible(
                  child: Container(
                            alignment: Alignment.topCenter,
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                
                            decoration: BoxDecoration(
                               image: DecorationImage(
                                image: AssetImage(
                                  data[lightKeys[index]]['led_status'].toString() == '1' ? 'images/lighton.png' : 'images/lightoff.png',
                                ),
                                fit: BoxFit.fill,
                              ), 
                              color: Color.fromARGB(255, 244, 234, 144),
                              borderRadius: BorderRadius.circular(20),
                
                            ),
                          ),
                ),
                
              ],
            ),
          )),
          );
        }
        catch(_)
        {
          return Center(child: Text("No lights yet...",
          textAlign:TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          ),);
        }

        
      } ,
     ),

    );
  } 
}









// Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           backgroundColor: Color.fromARGB(255, 27, 27, 27),
//           appBar: AppBar(
//             title: const Text("MyHome"),
//             centerTitle: true,
//             backgroundColor: Colors.black,
//           ),
//           body: Stack(
//            // mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 70,left:60),
//                 child: Text(
//                   "Left Light",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//                Padding(
//                 padding: EdgeInsets.only(top: 70,left:230),
//                 child: Text(
//                   "Right Light",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 100),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       alignment: Alignment.topCenter,
//                       height: 250.0,
//                       width: 150.0,

//                       decoration: BoxDecoration(
//                          image: DecorationImage(
//                           image: AssetImage(
//                             'images/newbulb2.png',
//                           ),
//                           fit: BoxFit.fill,
//                         ), 
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(20),

//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       alignment: Alignment.topCenter,
                      
//                       height: 250.0,
//                       width: 150.0,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('images/electric-light-bulb.png'),
//                           fit: BoxFit.fill,
                          
//                         ),
//                         color: Color.fromARGB(255, 240, 235, 235),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }