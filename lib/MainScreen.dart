import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:wellbeing_app/account.dart';
import 'package:wellbeing_app/dashboard.dart';
import 'package:wellbeing_app/home.dart';
import 'package:wellbeing_app/investigation.dart';
import 'package:wellbeing_app/navbar_key.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int selectedIndex = 1;
  final screen = [InvestigationScreen(), HomeScreen(), DashboardScreen(),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index : selectedIndex,
          key: NavBarKey.getKey(),
          color: Colors.pink[400],
          backgroundColor: Colors.white70,
          buttonBackgroundColor: Colors.pink[400],
          height: 60,
          items: <Widget>[
            Icon(Icons.emoji_emotions_outlined, size: 20, color: Colors.white,),
            Icon(Icons.home_outlined, size: 20, color: Colors.white,),
            Icon(Icons.emoji_emotions_outlined, size: 20, color: Colors.white,),
          ],
          animationDuration: Duration(
              milliseconds: 200
          ),
          animationCurve: Curves.easeInOut,
          onTap: (index){
            setState(() {
              selectedIndex =  index;
            });
          },

        ),
        body: screen[selectedIndex] ,
      );
  }
}


