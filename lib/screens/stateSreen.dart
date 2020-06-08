import 'package:flutter/material.dart';
import 'LoadingScreen.dart';
import 'middleScreen.dart';

class StateScreen extends StatefulWidget {
  final String typedValue, totalCase, deaths, recoveries;
  StateScreen({this.typedValue, this.totalCase, this.deaths, this.recoveries});
  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  MiddleScreen middleScreen = MiddleScreen();

  @override
  Widget build(BuildContext context) {
    var tc, d, r;
    tc = widget.totalCase;
    d = widget.deaths;
    r = widget.recoveries;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFF8B97FD),
        title: Center(
          child: Text(
            "Corona Cases",
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Lobster',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (conntext) => LoadingScreen()));
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Image.asset(
              "images/suggestions.jpeg",
              width: double.infinity,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: Container(
                    height: 200.0,
                    width: double.infinity,
                    color: Color(0xFF8B97FD),
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text(
                              widget.typedValue,
                              textAlign: TextAlign.center,
                              style: style,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Total Cases: $tc",
                            style: style,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Deaths: $d",
                            style: style,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Recoveries: $r",
                            style: style,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
