import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wellbeing_app/investigation.dart';
import 'package:wellbeing_app/navbar_key.dart';
import 'home.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'Charts/chart1.dart';
import 'Charts/chart2.dart';
import 'Charts/chart3.dart';
import 'Charts/chart4.dart';
import 'package:google_fonts/google_fonts.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  String _chosenValue = "I am satisfied with my life";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            centerTitle: true,
            title: Text("Dashboard",style: GoogleFonts.montserrat()),
            backgroundColor: Colors.pink[400],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(100)
                )),
          )),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: DropdownButton<String>(
                focusColor:Colors.pink,
                value: _chosenValue,
                //elevation: 5,
                style: GoogleFonts.montserrat(color: Colors.white),
                iconEnabledColor:Colors.black,
                items: <String>[
                  'I am satisfied with my life',
                  'What i do in my life is worthwhile',
                  'I was happy yesterday',
                  'I was anxious yesterday',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: GoogleFonts.montserrat(color:Colors.black, fontSize: 20),),
                  );
                }).toList(),
                hint:Text(
                  "Please choose a statement",
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onChanged: (String value) {
                  setState(() {
                     _chosenValue = value;
                  });
                },
              ),
            ),
            Container(
            child: _charts(_chosenValue),
          )]),
        ),
      ),
    );
  }}



Widget _charts(_chosenValue) {
  if (_chosenValue == "I am satisfied with my life") {
    return Chart1();
  }

  else if(_chosenValue == "What i do in my life is worthwhile") {
    return Chart2();
  }

  else if(_chosenValue == "I was happy yesterday") {
    return Chart3();
  }

  else if(_chosenValue == "I was anxious yesterday") {
    return Chart4();
  }
}