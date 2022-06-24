// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lastversion/Home.dart';
import 'package:lastversion/bottomnavbar.dart';
import 'package:lastversion/mainsignin.dart';
import 'package:lastversion/screens/reset_password.dart';
import 'package:lastversion/screens/reusable_widgets.dart';

import 'Firsthome.dart';
import 'classes/language.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register> {
  bool _isobsecure = true;
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  final formKey= GlobalKey<FormState>();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( 
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
         decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/0f3acc71f18597a61afe31e049795f73.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white10, BlendMode.lighten)),
        ),
      child:Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          reverse: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height*0.035, 20, 25),
            child: Column(
              children: <Widget>[
               
                SizedBox(
                    // height: 110,

                    child: const Center(
                      child: Text(
                        'NOORAK ',
                        style: TextStyle(
                          letterSpacing: 0.0099,
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
                      "Welcome!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign up to control your lights ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     SizedBox(
                  height: 50,
                ),


                //-----------Email Controller---------------

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
                  height: 15,
                ),

                //-----------Password Controller-------------

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
                        else if(value.length < 8){
                            return 'Password must be atleast 8 characters';
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
                
              
                const SizedBox(
                  height: 15,
                ),

               
                //----------------Confirm password---------------

              TextFormField(
                  controller: _confirmPasswordController,
                  validator:(value){
                        if(value!.isEmpty ){
                          errorMessage=' ';
                          return 'Password is required!';
                        }
                        else if (RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$').hasMatch(value!)){
                           return 'Invalid password';
                        }
                        else if(value != _passwordTextController.text )
                          return 'Passwords need to match';

                          else if(value.length < 8){
                            return 'Password must be atleast 8 characters';
                          }
                          else return null;
                        
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
                    
                    labelText: 'Confirm Password',
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
                //----------------Register Button----------------

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
                          errorMessage='';
                         await FirebaseAuth.instance
                       .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                        print("Created New Account");
                         Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                         });
                            
                        }
                        
                        on FirebaseAuthException catch(error){
                            errorMessage = error.message!;
                        }

                      }
                    },
                    child: Text(
                      "Register",
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

              

                signUpOption()
              ],
            ),
          ),
        ),
      )
       
      )
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have account?",
            style: TextStyle(color: Color.fromARGB(179, 236, 222, 222))),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Signin()));
          },
          child: const Text(
            " Sign In",
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
