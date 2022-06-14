// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lastversion/classes/language.dart';
import 'package:lastversion/register.dart';

import 'mainsignin.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    void _changeLanguage(Language language) {
      print(language.languageCode);
    }

    //double height_variable = MediaQuery.of(context).size.height;
    // double width_variable = MediaQuery.of(context).size.width;
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        
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
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children: <Widget>[
                          Text(lang.name, style: TextStyle(fontSize: 20),),
                          Text(lang.flag),
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
          ),
        ),
        child: Stack(
          children: [
          Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                    height: 228,
                    child: const Center(
                      child: Text(
                        'NOORAK ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              ],
            ), 
            Padding(
              padding: EdgeInsets.only(left: 70, top: 550),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Register()));
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 40),
                    primary: Color.fromRGBO(173, 71, 131, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(" Register",
                    style: TextStyle(
                        fontSize: 15, letterSpacing: 2, color: Colors.white)),
                /*  */
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 70, top: 600),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Signin()));
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 40),
                    primary: Color.fromARGB(255, 9, 4, 19),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),),
                  side: BorderSide(width:1,color:Color.fromARGB(255, 185, 45, 155).withOpacity(1),
                                                  
                 ),
 
                ),
                        
                child: Text(" Sign in",
                    style: TextStyle(
                        fontSize: 15, letterSpacing: 2, color: Colors.white)),
                /*  */
              ),
            ),
          ],
        ),
      ),
    );
  }
}
