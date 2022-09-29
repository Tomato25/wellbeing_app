import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wellbeing_app/investigation.dart';
import 'account.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'oneRecordScreen.dart';

class RecordsScreen extends StatefulWidget {
  @override
  _RecordsScreenState createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            centerTitle: true,
            title: Text("Records", style: GoogleFonts.montserrat()),
            backgroundColor: Colors.pink[400],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(60)
                )),
          )),
      body:
           Container(
          color: Colors.white,
          child: _buildBody(context),
        ));
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('answers').doc(auth.currentUser.uid).collection("answer").where("date", isLessThanOrEqualTo: new DateTime.now()).snapshots(),
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
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    var Question1 = record.Question1;
    var Question2 = record.Question2;
    var Question3 = record.Question3;
    var Question4 = record.Question4;
    var Question5 = record.Question5;
    var Question6 = record.Question6;
    var Question7 = record.Question7;
    var Question8 = record.Question8;
    var journalEntry = record.journalEntry;

    DateTime now = record.Date.toDate();
    DateFormat formatter = DateFormat('dd.MM.');
    var formatted = formatter.format(now);


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,

        child: InkWell(
          onTap: () =>
          {Navigator.push(context,
              MaterialPageRoute(builder: (context) => oneRecordScreen(Question1, Question2, Question3, Question4, Question5, Question6, Question7, Question8, formatted, journalEntry ),))},
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      25),
                  color: Colors.white,
                  gradient: LinearGradient(
                      colors: <Color>[
                        Colors.pink[400],
                        Colors.pinkAccent[200],
                      ])
              ),
              width: MediaQuery.of(context).size.width * 1,


              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Expanded(child:ListTile(

                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(formatted, style: GoogleFonts.montserrat(fontSize: 22.0, color: Colors.white)),
                      ),
                      subtitle: Text(record.Question8 + " steps",style: GoogleFonts.montserrat(fontSize: 16.0, color: Colors.white)),
                      trailing: Text(record.Question5, style: GoogleFonts.montserrat(fontSize: 22.0, color: Colors.white)),
                  ),

                  ),],),
            ),
          ),
        ),
      ),
    );

  }

}

class Record {
  final String Question1;
  final String Question2;
  final String Question3;
  final String Question4;
  final String Question5;
  final double Question6;
  final String journalEntry;
  final double Question7;
  final String Question8;
  final Timestamp Date;


  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['question1'] != null),
        assert(map['question2'] != null),
        assert(map['question3'] != null),
        assert(map['question4'] != null),
        assert(map['question5'] != null),
        assert(map['question6'] != null),
        assert(map['question7'] != null),
        assert(map['noOfSteps'] != null),
        assert(map['journalEntry'] != null),
        assert(map['date'] != null),

        Question1 = map['question1'],
        Question2 = map['question2'],
        Question3 = map['question3'],
        Question4 = map['question4'],
        Question5 = map['question5'],
        Question6 = map['question6'],
        Question7 = map['question7'],
        Question8 = map['noOfSteps'],
        journalEntry = map['journalEntry'],
        Date = map['date'];



  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);


  @override
  String toString() => "Record<$Question1:$Question2:$Question3:$Question4:$Question5:$Question6:$Question7:$Question8:$journalEntry:$Date:>";
}