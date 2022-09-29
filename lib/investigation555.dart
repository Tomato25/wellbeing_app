import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wellbeing_app/account.dart';
import 'package:wellbeing_app/investigation.dart';
import 'investigation6.dart';
import 'investigation4.dart';
import 'package:google_fonts/google_fonts.dart';
import 'investigation555.dart';

class InvestigationScreen555 extends StatefulWidget {
  InvestigationScreen555(DocumentReference answerRef);
  var ref = answerRef;

  @override
  _InvestigationScreen555State createState() => _InvestigationScreen555State();
}

class _InvestigationScreen555State extends State<InvestigationScreen555> {
  TextEditingController stepsInputController;

  @override
  initState() {
    stepsInputController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          // here the desired height
          child: AppBar(
            title: Center(child: Text("Daily check-in",style: GoogleFonts.montserrat())),
            backgroundColor: Colors.pink[400],
          )),
      body:
      SingleChildScrollView(
        child: Container(
          color: Colors.white70,
          child: Column(
              children: <Widget>[
                Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 12, 8, 35),
                      child: StepProgressIndicator(
                        totalSteps: 9,
                        currentStep: 8,
                        size: 15,
                        selectedColor: Colors.pinkAccent,
                        unselectedColor: Colors.pink[50],
                        roundedEdges: Radius.circular(15),
                      ),
                    )
                ),
                Stacked(),
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                padding: const EdgeInsets.fromLTRB(10, 20 , 10, 30),
                    child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "7685"),
                    controller: stepsInputController
                    )),
                    Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RaisedButton(
                    child: Text("Submmit"),
                    color: Colors.white,
                    textColor: Colors.pink,
                    splashColor: Colors.pinkAccent[100],
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.pink[600], width: 2)
                    ),
                    onPressed: () {
                    answerRef
                        .update({
                    "noOfSteps": stepsInputController.text
                    });
                    Navigator.pop(context);
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
                    }));}
                    ),
                    ),
                RaisedButton(
                    child: Text("Skip"),
                    color: Colors.white,
                    textColor: Colors.pink,
                    splashColor: Colors.pinkAccent[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.pink[600], width: 2)
                    ),
                    onPressed: () {
                      answerRef
                          .update({
                        "noOfSteps": ""
                      });
                      Navigator.pop(context);
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
                              }));}
                )
              ]),
        ),
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
                      child: Text("How many steps did you make yesterday",  textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 26.0, color: Colors.white),
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
