
import 'package:flutter/material.dart';
import 'package:placeholderapi/modules/business/Business_screen.dart';
import 'package:placeholderapi/modules/sciences/Science_screen.dart';
import 'package:placeholderapi/modules/sports/Sports_screen.dart';
import 'package:placeholderapi/screens/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen(),

  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',

    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Sciences',

    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'sports',

    ),
  ];

  void changeBottomNavBar(int index){

      currentIndex = index;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
          leading: Icon(
              Icons.menu,color: Colors.white,
          ),
        title: Text('news apps',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
              onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile()));
          }, icon: Icon(Icons.person,color: Colors.white,))
        ],
        elevation: 15.0,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index){
          setState(() {
            changeBottomNavBar(index);
            print(index);
          });
        },
        items: bottomItems,
          unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepOrange,
      ),
    );
  }
}
