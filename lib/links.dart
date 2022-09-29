import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'account.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class linksScreen extends StatefulWidget {
  @override
  _linksScreenState createState() => _linksScreenState();
}

class _linksScreenState extends State<linksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              centerTitle: true,
              title: Text("Useful links", style: GoogleFonts.montserrat()),
              backgroundColor: Colors.pink[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(60)
                  )),
            )),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: OpenUrlExample5(),
                  ),
                  Container(
                    child: OpenUrlExample3(),
                  ),
                  Container(
                    child: OpenUrlExample2(),
                  ),
                  Container(
                    child: OpenUrlExample1(),
                  ),

                ],
              ),
            ),
          ),
        )

    );
  }
}


class OpenUrlExample1 extends StatelessWidget {
  const OpenUrlExample1({Key key}) : super(key: key);

  _launchURL() async {
    const url = 'https://www.7cups.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        splashColor: Colors.pink,
        onTap:() =>
            _launchURL(),
        child: Ink(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.pink[800],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("7 cups", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                    "assets/images/arrow.svg", width: 80.0,
                    height: 80.0,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OpenUrlExample2 extends StatelessWidget {
  const OpenUrlExample2({Key key}) : super(key: key);

  _launchURL() async {
    const url = 'https://giveusashout.org/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        splashColor: Colors.pink,
        onTap:() =>
            _launchURL(),
        child: Ink(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.pink[600],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Shout 85258", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                    "assets/images/arrow.svg", width: 80.0,
                    height: 80.0,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OpenUrlExample3 extends StatelessWidget {
  const OpenUrlExample3({Key key}) : super(key: key);

  _launchURL() async {
    const url = 'https://studentspace.org.uk/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        splashColor: Colors.pink,
        onTap:() =>
            _launchURL(),
        child: Ink(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.pink[400],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Student Space", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                    "assets/images/arrow.svg", width: 80.0,
                    height: 80.0,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OpenUrlExample5 extends StatelessWidget {
  const OpenUrlExample5({Key key}) : super(key: key);

  _launchURL() async {
    const url = 'https://www.papyrus-uk.org/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        splashColor: Colors.pink,
        onTap:() =>
            _launchURL(),
        child: Ink(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.pink[400],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Papyrus", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                    "assets/images/arrow.svg", width: 80.0,
                    height: 80.0,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OpenUrlExample4 extends StatelessWidget {
  const OpenUrlExample4({Key key}) : super(key: key);

  _launchURL() async {
    const url = 'https://www.ntu.ac.uk/studenthub/student-help-advice-and-services/health-and-wellbeing';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        splashColor: Colors.pink,
        onTap:() =>
            _launchURL(),
        child: Ink(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.pink[600],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Student Wellbeing Service", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                    "assets/images/arrow.svg", width: 80.0,
                    height: 80.0,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}