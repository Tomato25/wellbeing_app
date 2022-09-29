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

class InvestigationScreen55 extends StatefulWidget {
  InvestigationScreen55(DocumentReference answerRef);
  var ref = answerRef;

  @override
  _InvestigationScreen55State createState() => _InvestigationScreen55State();
}

class _InvestigationScreen55State extends State<InvestigationScreen55> {
  double _currentSliderValue = 20;

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
      Container(
        color: Colors.white70,
        child: Column(
            children: <Widget>[
              Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 12, 8, 35),
                    child: StepProgressIndicator(
                      totalSteps: 9,
                      currentStep: 7,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(_currentSliderValue.toString(),
                    style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
                  ),
                  Text("min")
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50
                ),
                child:Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 60,
                  activeColor: Colors.pink,
                  inactiveColor: Colors.pink[100],
                  divisions: 60,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                    answerRef
                        .update({
                      "question7": _currentSliderValue});

                  },
                ),
              ),
              RaisedButton(
                  child: Text("Next"),
                  color: Colors.white,
                  textColor: Colors.pink,
                  splashColor: Colors.pinkAccent[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.pink[600], width: 2)
                  ),
                  onPressed: () {
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
                              return InvestigationScreen555(answerRef);
                            }));}
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
                      child: Text("How long was your workout?",  textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 26.0, color: Colors.white),
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


class DurationSlider extends StatefulWidget {
  @override
  _DurationSliderState createState() => _DurationSliderState();
}

class _DurationSliderState extends State<DurationSlider> {
  double _currentSliderValue = 20;


  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 60,
      activeColor: Colors.pink,
      inactiveColor: Colors.pink[100],
      divisions: 60,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
    answerRef
        .update({
    "question7": _currentSliderValue.toString()});

      },
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
                          GestureDetector(
                              onTap: ()
                              {   answerRef
                                  .update({
                                "question6": "1",
                              });
                              {Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(seconds: 2),
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
                              );}},
                              child: Text ("1" ,textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 24.0, color: Colors.black)))
                        ])),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: <Widget> [
                          GestureDetector(
                              onTap: () {   answerRef
                                  .update({
                                "question6": "2",
                              });{Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(seconds: 2),
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
                              );}},
                              child: Text ("2" ,textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 24.0, color: Colors.black)))
                        ])),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: <Widget> [
                          GestureDetector(
                              onTap: () {   answerRef
                                  .update({
                                "question6": "3",
                              });
                              {Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(seconds: 2),
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
                              );}},
                              child: Text ("3" ,textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 24.0, color: Colors.black)))
                        ])),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: <Widget> [
                          GestureDetector(
                              onTap: ()
                              {   answerRef
                                  .update({
                                "question6": "4",
                              });
                              {Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(seconds: 2),
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
                              );}},
                              child: Text ("4" ,textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 24.0, color: Colors.black)))
                        ])),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: <Widget> [
                          GestureDetector(
                              onTap: (){answerRef
                                  .update({
                                "question6": "5"
                              });
                              {Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => InvestigationScreen6(answerRef)));}},
                              child: Text ("5" ,textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 24.0, color: Colors.black)))
                        ])),
              ),
            ]
        ));
  }
}
