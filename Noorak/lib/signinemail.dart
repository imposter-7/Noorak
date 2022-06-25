// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lastversion/Home.dart';
import 'package:lastversion/classes/language.dart';
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
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final formKey= GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:true,
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:Text("NOORAK ",
        style: TextStyle(color:Colors.white,
        fontSize: 35,
        fontWeight: FontWeight.bold,
        shadows: <Shadow>[
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
                Icons.language_rounded,
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
                // _changeLanguage(language!);
              },
            ),
          ),
        ],
      ),
      body: Container( 
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        
         decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/0f3acc71f18597a61afe31e049795f73.jpg"),
              fit: BoxFit.cover,
             colorFilter: ColorFilter.mode(Color.fromARGB(48, 255, 243, 243), BlendMode.lighten)),
        ),
      child:Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          reverse: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height*0.035, 20, 20),
            child: Column(
              children: <Widget>[
               
                // SizedBox(
                //     // height: 110,

                //     child: const Center(
                //       child: Text(
                //         'NOORAK ',
                //         style: TextStyle(
                //           letterSpacing: 0.0099,
                //           color: Colors.white,
                //           fontSize: 35,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     )),

                     SizedBox(
                      height: 90,
                    ),
                    
                    Text(
                      "Welcome back !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
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


                //-----------Email Controller---------------

                // reusableTextField("Email", Icons.person_outline, false,
                //     _emailTextController),

                 TextFormField(
                  controller: _emailTextController,
                  validator:(value){
                        if(value!.isEmpty){
                          return 'Email is required!';
                          
                          }
                        else if(!RegExp(r'^[a-z0-9]+@[a-z]+\.[a-z]{2,4}$').hasMatch(value!)){
                           return 'Enter correct email';
                        }
                        else{
                          return null;
                        }
                      },
                  obscureText: false,
                  enableSuggestions: true,
                  autocorrect: true,
                  cursorColor: Color.fromARGB(255, 249, 247, 247),
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Color.fromARGB(179, 255, 255, 255),
                    ),
                    
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.black.withOpacity(0.7),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
                  ),
                  keyboardType: false
                      ? TextInputType.visiblePassword
                      : TextInputType.emailAddress,
                ),

                //------------------------------------------
                const SizedBox(
                  height: 20,
                ),

                //-----------Password Controller---------------

                // reusableTextField("Password..", Icons.lock_outline, true,
                //     _passwordTextController),

              TextFormField(
                  controller: _passwordTextController,

                  validator:(value){
                        if(value!.isEmpty ){
                          errorMessage=' ';
                          return 'Password is required!';
                        }
                        else if (RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$').hasMatch(value!)){
                           return 'invalid password';
                        }
                        else{
                          return null;
                        }
                      },
                  
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  cursorColor: Color.fromARGB(255, 249, 247, 247),
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9)),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Color.fromARGB(179, 255, 255, 255),
                    ),
                    
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.black.withOpacity(0.7),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
                  ),
                  keyboardType: true
                      ? TextInputType.visiblePassword
                      : TextInputType.emailAddress,
                ),
                Text(
                      errorMessage,
                      style: const TextStyle(
                          color: Color.fromARGB(221, 250, 9, 9), fontWeight: FontWeight.normal, fontSize: 16),
                    ),
                //----------------------------------------------
                // const SizedBox(
                //   // height: 5,
                // ),

                forgetPassword(context),

                //----------------Sign in Button----------------

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  child: ElevatedButton(
                    onPressed: () async {
                      // if the validation is correct, the user can be signed in 
                      if(formKey.currentState!.validate()){
                        try{
                          formKey.currentState?.save();
                          errorMessage='';
                          await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                                    email: _emailTextController.text.trim(),
                                    password: _passwordTextController.text.trim())
                                .then((value) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => FirstHome()));
                            });
                            
                        }
                        
                        on FirebaseAuthException catch(error){
                            errorMessage = error.message!;
                        }


                        // FirebaseAuth.instance
                        // .signInWithEmailAndPassword(
                        //             email: _emailTextController.text,
                        //             password: _passwordTextController.text)
                        //         .then((value) {
                        //       Navigator.push(context,
                        //           MaterialPageRoute(builder: (context) => HomePage()));
                        //     }).onError((error, stackTrace) {
                        //        if (error == 'auth/wrong-password') {
                        //           // return 'Wrong password.' ;
                        //         }
                        //       print("Error ${error.toString()}");
                        //     });
                      }
                    },
                    child: Text(
                      "Sign in",
                      style: const TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.black26;
                          }
                          return Colors.white;
                        }),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
                  ),
                ),

                // firebaseUIButton(context, "Sign In", () {
                //   FirebaseAuth.instance
                //       .signInWithEmailAndPassword(
                //           email: _emailTextController.text,
                //           password: _passwordTextController.text)
                //       .then((value) {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => HomePage()));
                //   }).onError((error, stackTrace) {
                //     print("Error ${error.toString()}");
                //   });
                // }),

                signUpOption()
              ],
            ),
          ),
        ),
      )
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
