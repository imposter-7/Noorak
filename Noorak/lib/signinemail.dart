// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'Firsthome.dart';

class Signinmail extends StatefulWidget {
  const Signinmail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Signinmail();
}

class _Signinmail extends State<Signinmail> {
  bool _isobsecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Welcome Back !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign in to control your lights ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 180),
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
                      SizedBox(height: 10,),

                          Text(
                        "Forget Password ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

               Padding(
                    padding: EdgeInsets.only( left:1),
                    child: ElevatedButton(
                      onPressed: () {
                             Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FirstHome()));
                      },
                      // ignore: sort_child_properties_last
                      child: Text("SignIN",
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
