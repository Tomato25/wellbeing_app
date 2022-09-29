import 'package:flutter/material.dart';
import 'Records.dart';
import 'package:google_fonts/google_fonts.dart';

class oneRecordScreen extends StatefulWidget {
  final String Question1;
  final String Question2;
  final String Question3;
  final String Question4;
  final String Question5;
  final String Question8;
  final double Question6;
  final double Question7;
  final String formatted;
  final String journalEntry;
  oneRecordScreen(String this.Question1 ,String this.Question2,String this.Question3,String this.Question4,String this.Question5,double this.Question6,double this.Question7,String this.Question8,String this.formatted,String this.journalEntry);

  @override
  _oneRecordScreenState createState() => _oneRecordScreenState();
}

class _oneRecordScreenState extends State<oneRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:PreferredSize(
        preferredSize: Size.fromHeight(100.0),
    child: AppBar(
    centerTitle: true,
    title: Text("Profile",style: GoogleFonts.montserrat()),
    backgroundColor: Colors.pink[400],
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(100)
    )),
    )),
    body: Padding(
      padding: const EdgeInsets.fromLTRB(8.0,15,8,0),
      child: Container(color: Colors.white70,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Column(
            children: <Widget>[
              Expanded(
                  flex: 7,
                  child: Center(
                      child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.elliptical(
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width, 100.0)),
                              gradient: LinearGradient(colors: <Color>[
                                Colors.pink[400],
                                Colors.pinkAccent[400],
                              ])
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 50.0, left: 20.0, right: 20),
                            child: Column(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.white, width: 2))
                                    ),
                                    height: 50,
                                    child: Row(children: [
                                      Text("Date:   ",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 20.0,
                                              color: Colors.white)),
                                      Text(widget.formatted,
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 20.0,
                                              color: Colors.white))
                                    ])
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.white, width: 2))
                                    ),
                                    height: 50,
                                    child: Row(children: [
                                      Text("Workout type:   ",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 20.0,
                                              color: Colors.white)),
                                      Text(widget.Question5,
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 20.0,
                                              color: Colors.white))
                                    ])
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.white, width: 2))
                                    ),
                                    height: 50,
                                    child: Row(children: [
                                      Text("Number of steps:   ", textAlign: TextAlign.left,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 20.0,
                                              color: Colors.white)),
                                      Text(widget.Question8,
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 20.0,
                                              color: Colors.white))
                                    ])
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.white, width: 2))
                                    ),
                                    height: 50,
                                    child: Row(children: [
                                      Text("Workout intensity (1-5):   ",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 20.0,
                                              color: Colors.white)),
                                      Text(widget.Question6.toString(),
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 20.0,
                                              color: Colors.white))
                                    ])
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.white, width: 2))
                                    ),
                                    height: 50,
                                    child: Row(children: [
                                      Text("Workout duration (min):   ",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 20.0,
                                              color: Colors.white)),
                                      Text(widget.Question7.toString(),
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 20.0,
                                              color: Colors.white))
                                    ])
                                ),
                              ),
                            ]),
                          )
                      )
                  ))
            ]
        ),
      ),
    ));
  } }