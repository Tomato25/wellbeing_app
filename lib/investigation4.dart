import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wellbeing_app/account.dart';
import 'package:wellbeing_app/investigation.dart';
import 'package:wellbeing_app/wellbeing_icons_icons.dart';
import 'investigation2.dart';
import 'investigation5.dart';
import 'investigation6.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestigationScreen4 extends StatefulWidget {
  InvestigationScreen4(DocumentReference answerRef);
  var ref = answerRef;

  @override
  _InvestigationScreen4State createState() => _InvestigationScreen4State();
}

class _InvestigationScreen4State extends State<InvestigationScreen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          // here the desired height
          child: AppBar(
            title: Center(child: Text("Daily check-in", style: GoogleFonts.montserrat())),
            backgroundColor: Colors.pink[400],
          )),
      body:
      Container(
        color: Colors.white70,
        child: Column(
            children: <Widget>[
              Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 12, 8, 35),
                    child: StepProgressIndicator(
                      totalSteps: 9,
                      currentStep: 5,
                      size: 15,
                      selectedColor: Colors.pinkAccent,
                      unselectedColor: Colors.pink[50],
                      roundedEdges: Radius.circular(15),
                    ),
                  )
              ),
              Stacked(),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50
                ),
                child: Emoji(),
              )
            ]),
      ),
    );
  }
}

class Stacked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        // The containers in the background
        new Column(
          children: <Widget>[
            new Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .10,
              color: Colors.white70,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.pink[400],
                            Colors.pinkAccent[400],
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(30)
                      )
                  ),
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .35,
                  child: Row( children: <Widget> [Expanded(child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 50 , 10, 30),
                      child: Text("Select yesterday's workout or activity",  textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 26.0, color: Colors.white),
                      )))])
              ),
            )],
        ),
        // The card widget with top padding,
        // incase if you wanted bottom padding to work,
        // set the `alignment` of container to Alignment.bottomCenter
        new Container(
            alignment: Alignment.topCenter,
            padding: new EdgeInsets.only(
                top: MediaQuery
                    .of(context)
                    .size
                    .height * .05,
                right: 20.0,
                left: 20.0),
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(120.0)),
              elevation: 2,
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset("assets/images/mindfulnesspink.svg", width: 120.0, height: 120.0),),
            )
        )
      ],
    );
  }
}


class Emoji extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(

        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children:<Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: <Widget> [
                          IconButton(icon: Icon(
                              WellbeingIcons.running),
                              color: Colors.black,
                              iconSize: 40,
                              onPressed: () =>
                              {   answerRef
                                  .update({
                                "question5": "Running",
                              }),



                                {
                                    Navigator.pop(context),
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
                                          return InvestigationScreen5(answerRef);
                                        }
                                    )
                                )},
                              }),
                          Text ("Running" ,textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey))
                        ])),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: <Widget> [
                          IconButton(
                            icon: Icon(
                                WellbeingIcons.dumbell),
                            color: Colors.black,
                            iconSize: 40,
                            onPressed: () =>
                            { answerRef
                                .update({
                              "question5": "Gym",
                            }),
                            Navigator.pop(context),
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
                                        return InvestigationScreen5(answerRef);
                                      }
                                  )
                              )},
                          ),
                          Text ("Gym" , textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey))
                        ])),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: <Widget> [
                          IconButton(
                            icon: Icon(
                                WellbeingIcons.meditation),
                            color: Colors.black,
                            iconSize: 40,
                            onPressed: () =>
                            { answerRef
                                .update({
                              "question5": "Meditation",
                              "question6": 0.0,
                              "question7": 0.0
                            }),
                              Navigator.pop(context),
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
                                        return InvestigationScreen6(answerRef);
                                      }
                                  )
                              )},
                          ),
                          Text ("Meditation" ,textAlign: TextAlign.center,style: GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey))
                        ])),
              ),
              Expanded(
                flex:3,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: <Widget> [
                          IconButton(
                            icon: Icon(
                                WellbeingIcons.bicycle),
                            color: Colors.black,
                            iconSize: 40,
                            onPressed: () =>
                            { answerRef
                                .update({
                              "question5": "Cycling",
                            }),
                              Navigator.pop(context),
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
                                        return InvestigationScreen5(answerRef);
                                      }
                                  )
                              )},
                          ),
                          Text ("Cycling" , textAlign: TextAlign.center,style: GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey))
                        ])),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: <Widget> [
                          IconButton(
                            icon: Icon(
                                WellbeingIcons.biceps),
                            color: Colors.black,
                            iconSize: 40,
                            onPressed: () =>
                            { answerRef
                                .update({
                              "question5": "Other",
                            }),
                              Navigator.pop(context),
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
                                        return InvestigationScreen5(answerRef);
                                      }
                                  )
                              )},
                          ),
                          Text ("Other" , textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey))
                        ])),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: <Widget> [
                          IconButton(
                            icon: Icon(
                                WellbeingIcons.sofa),
                            color: Colors.black,
                            iconSize: 40,
                            onPressed: () =>
                            { answerRef
                                .update({
                              "question5": "Custom",
                              "question6": 0.0,
                              "question7": 0.0
                            }),
                              Navigator.pop(context),
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
                                        return InvestigationScreen6(answerRef);
                                      }
                                  )
                              )},
                          ),
                          Text ("None" , textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey))
                        ])),
              ),
            ]
        ));
  }
}
