import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wellbeing_app/Charts/lowDurationWorkout.dart';
import '../home.dart';
import 'package:wellbeing_app/investigation.dart';
import 'package:wellbeing_app/dashboard.dart';
import 'intensityLow.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'intensityHigh.dart';
import 'highDurationWorkout.dart';
import 'lowDurationWorkout.dart';

class Chart1 extends StatefulWidget {


  @override
  _Chart1State createState() => _Chart1State();
}

class _Chart1State extends State<Chart1> {
  String _chosenValue = "Line Chart";

  @override Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Center(
                child: Column(
                    children: <Widget>[
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
                            border: Border.all(
                                color: Colors.pink[400],
                                width: 5),
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                          ),
                          child: _Selection(_chosenValue)
                      ),
                      DropdownButton<String>(
                        focusColor: Colors.pink,
                        value: _chosenValue,
                        //elevation: 5,
                        style: GoogleFonts.montserrat(color: Colors.white),
                        iconEnabledColor: Colors.black,
                        items: <String>[
                          'Bar Chart',
                          'Line Chart',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: GoogleFonts.montserrat(
                                color: Colors.black),),
                          );
                        }).toList(),
                        hint: Text(
                          "Change chart type",
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>
                          [ Column(
                              children: <Widget>[Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.4,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.05,
                                child: Center(child: Text(
                                    "You had highest workout intensity on:" ,style: GoogleFonts.montserrat(), textAlign: TextAlign.center)),
                              ),

                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 8.0, 0, 25),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              25),
                                          color: Colors.white,
                                          gradient: LinearGradient(
                                              colors: <Color>[
                                                Colors.pink[200],
                                                Colors.pinkAccent[200],
                                              ])
                                      ),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.4,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.2,

                                      child: highIntensityChart(),
                                    )
                                ),
                              ],),
                            Column(
                                children: <Widget>
                                [
                                  Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.4,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.05,
                                    child: Center(child: Text(
                                        "You had lowest workout intensity on:" ,style: GoogleFonts.montserrat(), textAlign: TextAlign.center)),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 8.0, 0, 25),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                25),
                                            color: Colors.white,
                                            gradient: LinearGradient(
                                                colors: <Color>[
                                                  Colors.pink[400],
                                                  Colors.pinkAccent[400],
                                                ])
                                        ),
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.4,
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.2,

                                        child: lowIntensityChart(),
                                      )
                                  ),
                                ])
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>
                          [ Column(
                              children: <Widget>[Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.4,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.05,
                                child: Center(child: Text(
                                    "Workouts longer than 30 min" ,style: GoogleFonts.montserrat(), textAlign: TextAlign.center)),
                              ),

                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 8.0, 0, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              25),
                                          color: Colors.white,
                                          gradient: LinearGradient(
                                              colors: <Color>[
                                                Colors.pink[200],
                                                Colors.pinkAccent[200],
                                              ])
                                      ),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.4,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.2,

                                      child: highDurationWorkout(),
                                    )
                                ),
                              ],),
                            Column(
                                children: <Widget>
                                [
                                  Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.4,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.05,
                                    child: Center(child: Text(
                                        "Workouts shorter than 30 min" ,style: GoogleFonts.montserrat(), textAlign: TextAlign.center)),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 8.0, 0, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                25),
                                            color: Colors.white,
                                            gradient: LinearGradient(
                                                colors: <Color>[
                                                  Colors.pink[400],
                                                  Colors.pinkAccent[400],
                                                ])
                                        ),
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width * 0.4,
                                        height: MediaQuery
                                            .of(context)
                                            .size
                                            .height * 0.2,

                                        child: lowDurationWorkout(),
                                      )
                                  ),
                                ])
                          ]),

                    ]),
              )
            ]));
  }
}



class SeriesChart1 extends StatefulWidget {
  @override
  _SeriesChart1State createState() => _SeriesChart1State();
}

class _SeriesChart1State extends State<SeriesChart1> {


  List<charts.Series <Record, DateTime>> _seriesBarData;
  List<Record> mydata;

  _generateData(mydata) {


    _seriesBarData = List<charts.Series<Record, DateTime>>();
    _seriesBarData.add(
      charts.Series(
        domainFn: (Record record, _) => record.Date.toDate(),
        measureFn: (Record record, _) => int.parse(record.Question1),
        colorFn: (Record record, _) =>
            charts.ColorUtil.fromDartColor(Colors.pink[600]),
        id: 'question1',
        data: mydata,
        labelAccessorFn: (Record row, _) => "helou",
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }


  Widget _buildBody(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('answers').doc(auth.currentUser.uid).collection("answer").where("date", isLessThanOrEqualTo:  new DateTime.now()).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          } else {

            List<Record> record = snapshot.data.docs.map((documentSnapshot) =>
                Record.fromMap(documentSnapshot.data())).toList();
            return _buildChart2(context, record);
          }
        });
  }



  Widget _buildChart2(BuildContext context, List<Record> record) {


    mydata = record;
    _generateData(mydata);


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[

                        Column(
                            children: <Widget>[

                              Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.redAccent,
                                  size: 30),
                              Text("1",style: GoogleFonts.montserrat()),

                            ]),
                        Column(
                            children: <Widget>[Icon(
                                Icons.sentiment_neutral,
                                color: Colors.deepOrangeAccent,
                                size: 30), Text("2",style: GoogleFonts.montserrat()),

                            ]),
                        Column(
                            children: <Widget>[Icon(
                                Icons.sentiment_satisfied,
                                color: Colors.lightGreenAccent,
                                size: 30), Text("3",style: GoogleFonts.montserrat()),

                            ]),
                        Column(
                            children: <Widget>[Icon(
                                Icons.sentiment_very_satisfied,
                                color: Colors.lightGreenAccent[700],
                                size: 30), Text("4",style: GoogleFonts.montserrat()),
                            ]),
                      ],),
                  )),
              SingleChildScrollView(
                  child: SizedBox(
                      height: 300,
                      child: charts.TimeSeriesChart(_seriesBarData,
                        primaryMeasureAxis: new charts.NumericAxisSpec(
                            viewport: new charts.NumericExtents(0, 4.0)),
                        domainAxis: new charts.DateTimeAxisSpec(
                          tickFormatterSpec: new charts
                              .AutoDateTimeTickFormatterSpec(
                            day: new charts.TimeFormatterSpec(
                              format: 'MMMMd',
                              transitionFormat: 'MMMMd',
                            ),
                          ),
                        ),

                        animate: true,

                        animationDuration: Duration(seconds: 1),
                        behaviors: [],
                      )
                  ))
            ],
          )
      ),
    );
  }
}



class BarChart1 extends StatefulWidget {
  @override
  _BarChart1State createState() => _BarChart1State();
}



class _BarChart1State extends State<BarChart1> {

  List<charts.Series <Record, String>> _seriesBarData1;
  List<Record> mydata1;


  _generateData(mydata1) {

    _seriesBarData1 = List<charts.Series<Record, String>>();

    _seriesBarData1.add(
      charts.Series(
        domainFn: (Record record, _) => DateFormat.MMMd().format(record.Date.toDate()),
        measureFn: (Record record, _) => int.parse(record.Question1),
        colorFn: (Record record, _) =>
            charts.ColorUtil.fromDartColor(Colors.pink[600]),
        id: 'question1',
        data: mydata1,
        labelAccessorFn: (Record row, _) => "helou",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }


  Widget _buildBody(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('answers').doc(auth.currentUser.uid).collection("answer").where("date", isLessThanOrEqualTo:  new DateTime.now()).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          } else {

            List<Record> record = snapshot.data.docs.map((documentSnapshot) =>
                Record.fromMap(documentSnapshot.data())).toList();
            return _buildChart1(context, record);
          }
        });
  }

  Widget _buildChart1(BuildContext context, List<Record> record) {


    mydata1 = record;
    _generateData(mydata1);


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[

                        Column(
                            children: <Widget>[

                              Icon(
                                  Icons.sentiment_very_dissatisfied,
                                  color: Colors.redAccent,
                                  size: 30),
                              Text("1",style: GoogleFonts.montserrat()),

                            ]),
                        Column(
                            children: <Widget>[Icon(
                                Icons.sentiment_neutral,
                                color: Colors.deepOrangeAccent,
                                size: 30), Text("2",style: GoogleFonts.montserrat()),

                            ]),
                        Column(
                            children: <Widget>[Icon(
                                Icons.sentiment_satisfied,
                                color: Colors.lightGreenAccent,
                                size: 30), Text("3",style: GoogleFonts.montserrat()),

                            ]),
                        Column(
                            children: <Widget>[Icon(
                                Icons.sentiment_very_satisfied,
                                color: Colors.lightGreenAccent[700],
                                size: 30), Text("4",style: GoogleFonts.montserrat()),
                            ]),
                      ],),
                  )),
              SingleChildScrollView(
                  child: SizedBox(
                      height: 300,
                      child: charts.BarChart(_seriesBarData1,
                        defaultRenderer: new charts.BarRendererConfig(
                          // By default, bar renderer will draw rounded bars with a constant
                          // radius of 100.
                          // To not have any rounded corners, use [NoCornerStrategy]
                          // To change the radius of the bars, use [ConstCornerStrategy]
                            cornerStrategy: const charts.ConstCornerStrategy(20)),
                        primaryMeasureAxis: new charts.NumericAxisSpec(
                            viewport: new charts.NumericExtents(0, 4.0)),

                        animate: true,

                        animationDuration: Duration(seconds: 1),
                        behaviors: [],
                      )
                  ))
            ],
          )
      ),
    );
  }
}

Widget _Selection(_chosenValue) {
  if (_chosenValue == "Line Chart") {
    return  SeriesChart1();
  }

  else if(_chosenValue == "Bar Chart") {
    return BarChart1();
  }
}




class Record {
  final String Question1;
  final String Question2;
  final String Question3;
  final String Question4;
  final String Question5;
  final double Question6;
  final Timestamp Date;


  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['question1'] != null),
        assert(map['question2'] != null),
        assert(map['question3'] != null),
        assert(map['question4'] != null),
        assert(map['date'] != null),

        Question1 = map['question1'],
        Question2 = map['question2'],
        Question3 = map['question3'],
        Question4 = map['question4'],
        Question5 = map['question5'],
        Question6 = map['question6'],
        Date = map['date'];



  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);


  @override
  String toString() => "Record<$Question1:$Question2:$Question3:$Question4:$Question5:$Question6:$Date:>";
}