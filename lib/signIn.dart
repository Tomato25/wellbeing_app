import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wellbeing_app/authentication.dart';
import 'package:wellbeing_app/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wellbeing_app/register.dart';
import 'package:wave/wave.dart';
import 'package:google_fonts/google_fonts.dart';



class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();


class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white),
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.all(120),
                        width: 150,
                        height: 150,
                        child: Center(
                          child: Image.asset(
                              'assets/images/logowellbeingpink.jpg',
                              fit: BoxFit.cover),
                        )),

                    Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.55,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Colors.pinkAccent[400],
                                Colors.pink[400],
                              ]),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 60, 20, 20),
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(10.0),

                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.indigo[900], width: 10),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.pink,
                                    fontStyle: FontStyle.italic),

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 20),
                            child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.indigo[900], width: 10),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.pink,
                                      fontStyle: FontStyle.italic),

                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                                  child: RaisedButton(
                                  child: Text("Sign in", style: GoogleFonts.montserrat()),
                                  color: Colors.white,
                                  textColor: Colors.pink,
                                  splashColor: Colors.pinkAccent[100],
                                  shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: Colors.pink[600], width: 2)
                                  ),
                                  onPressed: () { {
                                context.read<AuthenticationService>().signIn(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim()
                     );}}))]))
                  ],
                ),
              ),
      )
          );
  }
}
