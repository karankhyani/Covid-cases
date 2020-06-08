import 'package:CovidCases/screens/LoadingScreen.dart';
import 'package:CovidCases/screens/stateSreen.dart';
import 'package:flutter/material.dart';
import 'package:CovidCases/services/extractingData.dart';

class MiddleScreen extends StatefulWidget {
  final String typedValue;
  String totalStateCases, stateDeaths, stateRecovery;
  MiddleScreen({this.typedValue});

  @override
  _MiddleScreenState createState() => _MiddleScreenState();
}

class _MiddleScreenState extends State<MiddleScreen> {
  String typedState;
  @override
  void initState() {
    super.initState();
    typedState = typedValue;
    stateData();
  }

  void stateData() async {
    ExtractData extractData = ExtractData();
    await extractData.extractStateData(widget.typedValue);

    widget.totalStateCases = extractData.totalStateCases.toString();
    widget.stateDeaths = extractData.stateDeaths.toString();
    widget.stateRecovery = extractData.stateRecovery.toString();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => StateScreen(
          typedValue: typedState,
          totalCase: widget.totalStateCases,
          deaths: widget.stateDeaths,
          recoveries: widget.stateRecovery,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple.shade900,
        body: Column(
          children: <Widget>[
            Flexible(
              child: Image.asset(
                'images/state.jpeg',
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
