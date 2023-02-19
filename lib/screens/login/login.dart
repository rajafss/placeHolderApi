import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:placeholderapi/screens/home_screen.dart';
import 'package:placeholderapi/screens/profile/profile_screen.dart';
import 'package:placeholderapi/screens/signup/signup.dart';
import 'package:placeholderapi/shared/authentification/authentification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  String? email, password;
 @override

 firebaseAuth()  {
   AuthenticationHelper()
       .signIn(email: email!, password: password!)
       .then((result) {
     if (result != null) {
       Navigator.pushReplacement(context,
           MaterialPageRoute(builder: (context) => HomeScreen()));
     } else {
        Text(
           result,
           style: TextStyle(fontSize: 16),

       );
     }
   });

 }
  // static Future<User?> loginUsingEmailPassword({required String email ,
  //   required String password , required BuildContext context}) async{
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;
  //   try{
  //     UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
  //     user = userCredential.user;
  //   } on FirebaseAuthException catch(e)
  //   {
  //     if(e.code == "user-not-found"){
  //       print('no user found for that email');
  //     }
  //   }
  //   return user;
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Login',
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  fontSize: 30.0
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: 300.0,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Enter your email',
                  ),
                  onChanged: (value)
                  {
                    email = value.trim();
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 300.0,
                child: TextField(

                  controller: _password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                  ),
                  onChanged: (value)
                  {
                    password = value.trim();
                  },
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                width: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.deepOrange
                ),
                child: MaterialButton(
                    onPressed: ()async{
                      // User? user = await loginUsingEmailPassword(
                      //     email: _email.text, password: _password.text, context: context);
                      // if(user != null)
                      // { print(user);
                      //   Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => HomeScreen(),
                      //     ),
                      //   );

                      // print('${_email}, ${_password}');

                        firebaseAuth();


                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),


                    )),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 300.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue
                ),
                child: MaterialButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  HomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Faceboock',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),


                    )),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: 300.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),

                    color: Colors.blue
                ),
                child: MaterialButton(
                    onPressed: (){
                      print('${_email}, ${_password}');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Google',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),


                    )),
              ),
              SizedBox(
                height: 40.0,
              ),
              RaisedButton(onPressed: (){},
              child:  GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/signup');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text('Get Registered Now!!',
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
              ),),

            ],
          ),
        ),
      ),
    );
  }
}
