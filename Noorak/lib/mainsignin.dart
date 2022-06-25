// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use


import 'package:flutter/material.dart';
import 'package:lastversion/signinemail.dart';

import 'classes/language.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Signin();
}
void _changeLanguage(Language language) {
      print(language.languageCode);
    }

class _Signin extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
       extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:Text("NOORAK ",
        style: TextStyle(color:Colors.white,
        fontSize: 35,
        fontWeight: FontWeight.bold,
        shadows: const <Shadow>[
                          Shadow(
                          offset: Offset(5.0, 5.0),
                          blurRadius: 8.0,
                          color: Color.fromARGB(124, 3, 3, 3),
                        ),
                      ],
        ),
        
        ),
        centerTitle: true,
          actions: <Widget>[

          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.langugelist()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(children: <Widget>[
                          Text(lang.flag),
                          Text(lang.name),
                        ]),
                      ))
                  .toList(),
              onChanged: (Language? language) {
                _changeLanguage(language!);
              },
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/0f3acc71f18597a61afe31e049795f73.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Color.fromARGB(48, 255, 243, 243), BlendMode.lighten)),
        ),
        child: Stack(
          children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                /* SizedBox(
                    height: 150,
                    child: const Center(
                      child: Text(
                        'NOORAK ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )), */
                SizedBox(
                  height: 235,
                ),
                Padding(padding: EdgeInsets.only(right:200),
                child: Text(
                        "Control ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                          Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 8.0,
                          color: Color.fromARGB(124, 3, 3, 3),
                        ),
                      ],
                        ),
                      ),
                ),
                 Padding(padding: EdgeInsets.only(right:150),
                child: Text(
                        "Anywhere ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                          Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 8.0,
                          color: Color.fromARGB(124, 3, 3, 3),
                        ),
                      ],
                        ),
                      ),
                ),
          SizedBox(height: 136),
                Padding(
                    padding: EdgeInsets.only( left:1),
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Signinmail())); 
                      },
                      child: Text("Sign in with Email",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                
                          primary: Color.fromARGB(255, 46, 28, 66).withOpacity(0.9),
                          padding: EdgeInsets.symmetric(horizontal: 115,vertical: 15),
                          shape: RoundedRectangleBorder(
                            
                              borderRadius: BorderRadius.circular(20),
                            
                              
                              
                              ),
                              side: BorderSide(width:1,color:Color.fromARGB(255, 89, 58, 133).withOpacity(0),
                              )
                              
                              ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only( left:35),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Google",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                        
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 50,vertical: 12),
                          shape: RoundedRectangleBorder(
                            
                              borderRadius: BorderRadius.circular(20)
                              
                              
                              ),
                              
                              
                              ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only( left:40),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("AppleID",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                        
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 50,vertical: 12),
                          shape: RoundedRectangleBorder(
                            
                              borderRadius: BorderRadius.circular(20)
                              
                              
                              ),
                              
                              
                              ),
                    ),
                  ),

             
              ],
            ),
            SizedBox(height: 20,),
            Text("By Continuing you agree to the Terms and Conditions",
            style: TextStyle(color: Color.fromARGB(255, 255, 250, 250),fontSize: 14,fontWeight: FontWeight.normal),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
