import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'account.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'links.dart';

class helpScreen extends StatefulWidget {
  @override
  _helpScreenState createState() => _helpScreenState();
}

class _helpScreenState extends State<helpScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar:PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              centerTitle: true,
              title: Text("Help", style: GoogleFonts.montserrat()),
              backgroundColor: Colors.pink[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(60)
                  )),
            )),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Container(
            child: Column(
              children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: InkWell(
              splashColor: Colors.pink,
              onTap:() =>
              {Navigator.push(
                  context,
                  PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder: (
                          context, animation, animationTime, child) {
                        animation = CurvedAnimation(
                            parent: animation, curve: Curves.elasticOut
                        );
                        return ScaleTransition(
                            alignment: Alignment.center,
                            scale: animation,
                            child: child);
                      },
                      pageBuilder: (context, animation, animationTime){
                        return linksScreen();
                      }
                  )
              )},
              child: Ink(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.pink[400],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget> [
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Text("Useful links", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
                   ),
                    Padding(
                        padding: const EdgeInsets.all(30.0),
                          child: SvgPicture.asset(
                              "assets/images/link.svg", width: 80.0,
                              height: 80.0,
                              color: Colors.white),
                        )
                ],
              ),
              ),
          ),
            ),
                Container(

                child: OpenUrlExample(),
                ),Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: InkWell(
                    splashColor: Colors.pink,
                    onTap:() =>
                    {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountScreen()))},
                    child: Ink(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.pink[800],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text("Disclaimers", textAlign: TextAlign.left, style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: SvgPicture.asset(
                                "assets/images/information.svg", width: 80.0,
                                height: 80.0,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )

    );
  }
}


class OpenUrlExample extends StatelessWidget {
  const OpenUrlExample({Key key}) : super(key: key);

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
          height: MediaQuery.of(context).size.height * 0.25,
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