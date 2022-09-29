import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wellbeing_app/Charts/chart2.dart';
import 'package:wellbeing_app/dashboard.dart';
import 'package:wellbeing_app/investigation.dart';
import 'account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wellbeing_app/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'help.dart';
import 'signIn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import'package:wellbeing_app/Records.dart';


class HomeScreen extends StatefulWidget {

  HomeScreen ({Key key, this.title, this.uid}) : super(key: key);
  //update the constructor to include the uid
  final String title;
  final String uid; //include this


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
          // here the desired height
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("Home", style: GoogleFonts.montserrat()),
          backgroundColor: Colors.pink[400],
          )),

      drawer: CustomDrawer(),

      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
            child: Column(
            children: <Widget>[

              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.pink[400],
                          Colors.white,
                        ])
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text("You again! Hope you are having a wonderful day", textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 25.0, color: Colors.white)),
                ),
              ),
                Container(
                  child:  SvgPicture.asset(
                      "assets/images/joyfeeling.svg", width: 150.0,
                      height: 150.0),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 0),
                  child: InkWell(
                  splashColor: Colors.pink,
                  onTap:() =>
                  {Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          transitionsBuilder: (context, animation, animationTime,
                              child) {
                            animation = CurvedAnimation(
                                parent: animation, curve: Curves.elasticOut
                            );
                            return ScaleTransition(
                                alignment: Alignment.center,
                                scale: animation,
                                child: child);
                          },
                          pageBuilder: (context, animation, animationTime) {
                            return InvestigationScreen();}))},
                    child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.pink[400],
                    ),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Daily Check-in", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
                    ),
                  Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: SvgPicture.asset(
                        "assets/images/checked.svg", width: 80.0,
                        height: 80.0,
                        color: Colors.white),
                  ),

            ],
            ),
            ),
            ),
            ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  splashColor: Colors.pink,
                  onTap:() =>
                  {
                  Navigator.push(
                  context,
                  PageRouteBuilder(
                  transitionDuration: Duration(seconds: 1),
                  transitionsBuilder: (context, animation, animationTime,
                  child) {
                  animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticOut
                  );
                  return ScaleTransition(
                  alignment: Alignment.center,
                  scale: animation,
                  child: child);
                  },
                  pageBuilder: (context, animation, animationTime) {
                  return RecordsScreen();}))},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.pink[400],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Records", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: SvgPicture.asset(
                              "assets/images/agenda.svg", width: 80.0,
                              height: 80.0,
                              color: Colors.white),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15 , 15.0, 15 ,0),
                child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.55,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.pink[400],
                          width: 5),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: SeriesChart2()
                ),
              ),

            ])),
      ));
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    Colors.pink[400],
                    Colors.pinkAccent[400],
                  ])
              ),
              child: Container(
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                              "assets/images/mindfulnesspink.svg", width: 80.0,
                              height: 80.0),),
                      ),
                      Padding(padding: EdgeInsets.all(8.0),
                          child: Text("NTU Wellbeing", style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 20.0))
                      ),
                    ],
                  )),
            ),
            CustomListTile(Icons.home_outlined, "Home", () =>
            {Navigator.pop(context),
            Navigator.push(
            context,
            PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: (context, animation, animationTime,
            child) {
            animation = CurvedAnimation(
            parent: animation, curve: Curves.elasticOut
            );
            return ScaleTransition(
            alignment: Alignment.center,
            scale: animation,
            child: child);
            },
            pageBuilder: (context, animation, animationTime) {
            return HomeScreen();
            }
            )
            )}),
            CustomListTile(Icons.analytics_outlined, "Dashboard", () =>
            {Navigator.pop(context),
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(seconds: 1),
                  transitionsBuilder: (
                  context, animation, animationTime, child) {
                    animation = CurvedAnimation(
                    parent: animation, curve: Curves.elasticOut
                    );
                    return ScaleTransition(
                      alignment: Alignment.center,
                      scale: animation,
                      child: child);
            },
            pageBuilder: (context, animation, animationTime){
                    return DashboardScreen();
            }
                  )
                )}),
            CustomListTile(Icons.assignment_ind_outlined, "Records", () =>
            {Navigator.pop(context),
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder: (
                          context, animation, animationTime, child) {
                        animation = CurvedAnimation(
                            parent: animation, curve: Curves.elasticOut
                        );
                        return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child);
                      },
                      pageBuilder: (context, animation, animationTime){
                        return RecordsScreen();
                      }
                  )
              )}),
            CustomListTile(Icons.emoji_emotions_outlined, "Daily Check-In", () =>
            {Navigator.pop(context),
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder: (
                          context, animation, animationTime, child) {
                        animation = CurvedAnimation(
                            parent: animation, curve: Curves.elasticOut
                        );
                        return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child);
                      },
                      pageBuilder: (context, animation, animationTime){
                        return InvestigationScreen();
                      }
                  )
              )}),
            CustomListTile(Icons.account_circle_outlined, "Profile", () =>
            {Navigator.pop(context),
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder: (
                          context, animation, animationTime, child) {
                        animation = CurvedAnimation(
                            parent: animation, curve: Curves.elasticOut
                        );
                        return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child);
                      },
                      pageBuilder: (context, animation, animationTime){
                        return AccountScreen();
                      }
                  )
              )}),
            CustomListTile(Icons.help_outline, "Help", () =>
            {Navigator.pop(context),
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder: (context, animation, animationTime,
                          child) {
                        animation = CurvedAnimation(
                            parent: animation, curve: Curves.elasticOut
                        );
                        return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child);
                      },
                      pageBuilder: (context, animation, animationTime) {
                        return helpScreen();
                      }
                  )
              )}),
              CustomListTile(Icons.lock_outline_rounded, "Log out", () =>
              {
                context.read<AuthenticationService>().signOut(),
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()))
              }),
            ],
        ));
  }
}


class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
     child: Container(

       decoration: BoxDecoration(
           color: Colors.white70 ,
         border: Border(bottom: BorderSide(color: Colors.grey.shade400))
       ),
       child: InkWell(
         splashColor: Colors.pinkAccent[400],
         onTap: onTap,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget> [
             Container(
               height: 60,
               child: Row(
                 children: <Widget>[
                   Icon (icon),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text (text, style: GoogleFonts.montserrat(
                       fontSize: 16.0
                     ),),
                   ),
                 ],
               ),
             ),
             Icon(Icons.arrow_right),
           ],
         ),
       ),
     ),
   );
  }

}
