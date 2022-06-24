// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lastversion/Home.dart';
import 'package:lastversion/register.dart';
import 'package:lastversion/screens/reset_password.dart';
import 'package:lastversion/screens/reusable_widgets.dart';

import 'Firsthome.dart';

class Signinmail extends StatefulWidget {
  const Signinmail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Signinmail();
}

class _Signinmail extends State<Signinmail> {
  bool _isobsecure = true;
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
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

        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          reverse: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height*0.035, 20, 20),
            child: Column(
              children: <Widget>[
               
                SizedBox(
                    // height: 110,

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
                      height: 110,
                    ),
                    
                    Text(
                      "Welcome back !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign in to control your lights ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(
                  height: 100,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Sign In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
        // child: Stack(
        //   children: [
        //     Column(
        //       children: [
        //        SizedBox(
        //             height: 150,
               
        //             child: const Center(
        //               child: Text(
        //                 'NOORAK ',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 35,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //             )),
        //              SizedBox(
        //           height: 80,
        //         ),
        //         Column(
        //           children: [
        //             Text(
        //               "Welcome Back !",
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 24,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //             Text(
        //               "Sign in to control your lights ",
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 20,
        //               ),
        //             ),
        //           ],
        //         ),
        //          SizedBox(height: 180),
        //               Container(
        //                 width: 300,
        //                 decoration: BoxDecoration(
        //                   color: Color.fromARGB(255, 70, 63, 63),
        //                   borderRadius: BorderRadius.circular(16),
        //                 ),
        //                 child: TextField(
        //                   decoration: InputDecoration(
        //                     border: InputBorder.none,
        //                     hintText: 'Email',
        //                     hintStyle: TextStyle(
        //                         color: Color.fromARGB(211, 221, 215, 215)),
        //                     prefixIcon: Padding(
        //                       padding: EdgeInsets.only(right: 10, left: 5),
        //                       child: Icon(
        //                         Icons.email,
        //                         color: Colors.white,
        //                         size: 30,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(height: 10),
        //               Container(
        //                 width: 300,
        //                 decoration: BoxDecoration(
        //                   color: Color.fromARGB(255, 70, 63, 63),
        //                   borderRadius: BorderRadius.circular(16),
        //                 ),
        //                 child: TextField(
        //                   obscureText: _isobsecure,
        //                   decoration: InputDecoration(
        //                     border: InputBorder.none,
        //                     hintText: 'Password',
        //                     hintStyle: TextStyle(
        //                         color: Color.fromARGB(211, 221, 215, 215)),
        //                     prefixIcon: Padding(
        //                       padding: EdgeInsets.only(right: 10),
        //                       child: Icon(
        //                         Icons.lock,
        //                         color: Colors.white,
        //                         size: 30,
        //                       ),
        //                     ),
        //                     suffixIcon: Padding(
        //                       padding: EdgeInsets.only(right: 10, left: 5),
        //                       child: IconButton(
        //                           // ignore: unnecessary_new
        //                           icon: new Icon(Icons.remove_red_eye,
        //                               color: Colors.white, size: 30),
        //                           onPressed: () {
        //                             setState(() {
        //                               _isobsecure = !_isobsecure;
        //                             });
        //                           }),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(height: 10,),

        //                   Text(
        //                 "Forget Password ?",
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 15,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
            
              //  Padding(
              //       padding: EdgeInsets.only( left:1),
              //       child: ElevatedButton(
              //         onPressed: () {
              //                Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => FirstHome()));
              //         },
              //         // ignore: sort_child_properties_last
              //         child: Text("SignIN",
              //             style: TextStyle(
              //                 fontSize: 15,
              //                 color: Colors.white)),
              //         style: ElevatedButton.styleFrom(
              //             primary: Colors.grey[600]?.withOpacity(0.5),
              //             padding: EdgeInsets.symmetric(horizontal: 50),
              //             shape: RoundedRectangleBorder(
                            
              //                 borderRadius: BorderRadius.circular(20)
                              
                              
              //                 ),
              //                 side: BorderSide(width:1,color:Color.fromRGBO(173, 71, 131, 1),
              //                 )
                              
              //                 ),
              //       ),
                 
              //  ),
              // ],
            // ),
          // ],
        // ),
      // ),
      )
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Color.fromARGB(179, 236, 222, 222))),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Register()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Color.fromARGB(255, 235, 228, 228), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Color.fromARGB(179, 255, 254, 254)),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }

}
