
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placeholderapi/screens/login/login.dart';
import 'package:placeholderapi/shared/authentification/authentification.dart';

class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              'Profile',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue
                ),
                  child: Image.asset('assets/image.png',width: 100,height: 100,)),
            ),
            SizedBox(height: 20.0,),
            Text("Raja Saad" ,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black45
            ),),
            SizedBox(height: 40.0,),
            Container(

              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    hintText: 'email',


                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(

              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  hintText: 'fdfdfdfdf',
                  suffixIcon: Icon(Icons.remove_red_eye)

                ),
              ),
            ),
            SizedBox(height: 40.0,),
            Container(
              width: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),

                  color: Colors.blue
              ),
              child: MaterialButton(
                  onPressed: (){
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),


                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthenticationHelper()
              .signOut()
              .then((_) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (contex) => LoginScreen()),
          ));
        },
        child: Icon(Icons.logout),
        tooltip: 'Logout',
      ),
    );
  }
}
