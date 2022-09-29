import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../home.dart';
import 'package:wellbeing_app/investigation.dart';
import 'package:wellbeing_app/dashboard.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class lowIntensityChart extends StatefulWidget {
  @override
  _lowIntensityChartState createState() => _lowIntensityChartState();
}

class _lowIntensityChartState extends State<lowIntensityChart> {

  String result;


  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}


Widget _buildBody(BuildContext context) {

  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('answers').doc(auth.currentUser.uid).collection("answer").where("question6", isLessThanOrEqualTo: 2).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {

          List<Record> record = snapshot.data.docs.map((documentSnapshot) =>
              Record.fromMap(documentSnapshot.data())).toList();
          return _buildList(context, snapshot.data.docs);
        }
      });
}

Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  final record = Record.fromSnapshot(data);

  DateTime now = record.Date.toDate();
  DateFormat formatter = DateFormat('dd.MM.');
  String formatted = formatter.format(now);

  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
    child: Container(
        width: 100,
        height: 50,
        child: Center(child: Text(formatted,  textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 16.0, color: Colors.white)))),
  );


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