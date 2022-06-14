// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lastversion/bottomnavbar.dart';

import 'Firsthome.dart';
import 'classes/language.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register> {
  // to check if text visible or not for password
  bool _isobsecure = true;
  //for checkbox value
  bool isChecked = false;
  void _changeLanguage(Language language) {
      print(language.languageCode);
    }
  @override
  Widget build(BuildContext context) {

  
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
              colorFilter: ColorFilter.mode(Colors.white10, BlendMode.lighten)),
        ),
        child: Stack(
          children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
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
                    )),
                SizedBox(
                  height: 80,
                ),
                Column(
                  children: [
                    Text(
                      "Welcome !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign up to control your lights ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 80),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 70, 63, 63),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(211, 221, 215, 215)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 10, left: 5),
                            child: Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 70, 63, 63),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        obscureText: _isobsecure,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(211, 221, 215, 215)),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 10, left: 5),
                            child: IconButton(
                                // ignore: unnecessary_new
                                icon: new Icon(Icons.remove_red_eye,
                                    color: Colors.white, size: 30),
                                onPressed: () {
                                  setState(() {
                                    _isobsecure = !_isobsecure;
                                  });
                                }),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 70, 63, 63),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        obscureText: _isobsecure,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(211, 221, 215, 215)),
                          contentPadding: EdgeInsets.only(left: 40, top: 15),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 10, left: 5),
                            child: IconButton(
                                // ignore: unnecessary_new
                                icon: new Icon(Icons.remove_red_eye,
                                    color: Colors.white, size: 30),
                                onPressed: () {
                                  setState(() {
                                    _isobsecure = !_isobsecure;
                                  });
                                }),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(top:12),
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Checkbox(

                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                             /*  if(isChecked!=true)
                              {

                              } */
                            });
                          }),
                          Container(
                            margin: EdgeInsets.only(left:4),
                            child: Text(
                              "I agree to the Terms & Privecy Ploicy  ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          SizedBox(height:10),
                          
                      ],
                    ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only( left:1),
                    child: ElevatedButton(
                      onPressed: () {
                           Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FirstHome()));
                      },
                      // ignore: sort_child_properties_last
                      child: Text("Register",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey[600]?.withOpacity(0.5),
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                            
                              borderRadius: BorderRadius.circular(20)
                              
                              
                              ),
                              side: BorderSide(width:1,color:Color.fromRGBO(173, 71, 131, 1),
                              )
                              
                              ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
