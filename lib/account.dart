import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellbeing_app/authentication.dart';
import 'package:wellbeing_app/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wellbeing_app/investigation.dart';
import 'package:google_fonts/google_fonts.dart';



class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

class _AccountScreenState extends State<AccountScreen> {
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
      body: _buildBody(context)

    );
  }

}

Widget _buildBody(BuildContext context) {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('users').where("uid", isEqualTo: auth.currentUser.uid).snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return LinearProgressIndicator();

      return _buildList(context, snapshot.data.docs);
    },
  );
}


Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
  return ListView(
    children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
  final record = Record.fromSnapshot(data);

  return Container(color: Colors.white70,
    height:  MediaQuery
        .of(context)
        .size
        .height,
    child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 30.0),
                  child: Container(
                    child: Material(
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      elevation: 10,
                      child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: SvgPicture.asset(
                              "assets/images/camera.svg", width: 80.0,
                              height: 80.0,
                              color: Colors.pink[400])),
                    ),)
              ),),),
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
                                MediaQuery.of(context).size.width, 100.0)),
                        gradient: LinearGradient(colors: <Color>[
                          Colors.pink[400],
                          Colors.pinkAccent[400],
                        ])
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20),
                      child: Column(children: <Widget> [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.white, width: 2))
                              ),
                              height:50,
                              child: Row( children: [ Text("First name:   ", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
                                Text(record.fname, textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white))
                              ])
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.white, width: 2))
                              ),
                              height:50,
                              child: Row( children: [ Text("Last name:   ", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
                                Text(record.surname, textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white))
                              ])
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.white, width: 2))
                              ),
                              height:50,
                              child: Row( children: [ Text("Email:   ", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
                                Text(record.email, textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white))
                              ])
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.white, width: 2))
                              ),
                              height:50,
                              child: Row( children: [ Text("Student ID:   ", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
                                Text(record.studentID, textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white))
                              ])
                          ),
                        ),
                      ]),
                    )
                  )
              ))
        ]
    ),
  );
}


class Record {
  final String fname;
  final String surname;
  final String email;
  final String studentID;

  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['fname'] != null),
        assert(map['surname'] != null),
        assert(map['email'] != null),
        assert(map['studentID'] != null),

        fname = map['fname'],
        surname = map['surname'],
        email = map['email'],
        studentID = map['studentID'];


        Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);


  @override
  String toString() => "Record<$fname:$surname:$email:$studentID:>";
}