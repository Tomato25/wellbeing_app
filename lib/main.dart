import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_app/MainScreen.dart';
import 'package:wellbeing_app/account.dart';
import 'package:wellbeing_app/authentication.dart';
import 'package:wellbeing_app/home.dart';
import 'signIn.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
    runApp(WellbeingApp());
}


class WellbeingApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
      primarySwatch: Colors.indigo,
      brightness: brightness,
    ),
    themedWidgetBuilder: (context, theme) {
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
              create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
              create: (context) => context.read<AuthenticationService>().authStateChanges, )

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Wellbeing App",
          theme: ThemeData(fontFamily: "Roboto"),
          home: AuthenticationWrapper(),
        ));
  });
}}

class AuthenticationWrapper extends StatelessWidget {
  final keyIsFirstLoaded = 'is_first_loaded';

  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return HomeScreen();
    }

    return SignInScreen();

    //return Container();
  }


  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Welcome to the NTU Wellbeing App", textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.pink)),
            content: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
              Text("Daily Check-in", textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.pink)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,8,0,35),
                child: Text("Complete your daily-check in by answering questions about your wellbeing and physical activity", textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 18.0, color: Colors.black)),
              ),
              Text("Dashboard", textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.pink)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,8,0,35),
                child: Text("Check your results in form of charts and more", textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 18.0, color: Colors.black)),
              ),
              Text("Help", textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.pink)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,8,0,35),
                child: Text("Find useful links", textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 18.0, color: Colors.black)),
              ),
              Text("Profile", textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.pink)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,8,0,35),
                child: Text("Check and edit your details", textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 18.0, color: Colors.black)),
              ),
            ]),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Dismiss", style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.pink)),
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                  prefs.setBool(keyIsFirstLoaded, false);

                },
              ),
            ],
          );
        },
      );
    }
  }
}