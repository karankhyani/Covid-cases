import 'package:CovidCases/screens/middleScreen.dart';
import 'package:CovidCases/services/stateList.dart';
import 'package:flutter/material.dart';
import 'package:CovidCases/services/extractingData.dart';

List<DropdownMenuItem<String>> menu = [];

const TextStyle style = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Tenali',
  fontStyle: FontStyle.italic,
  color: Colors.white,
);
var totalCase = 0, death = 0, recover = 0;
String typedValue;

class LoadingScreen extends StatefulWidget {
  final String val;
  LoadingScreen({this.val});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String selectedValue;
  @override
  void initState() {
    super.initState();
    updateUI();
    getMenu();
  }

  void getMenu() {
    for (int i = 0; i < StateList().stateList.length; i++) {
      var newItem = DropdownMenuItem(
        child: Text(StateList().stateList[i]),
        value: StateList().stateList[i],
      );
      menu.add(newItem);
    }
  }

  void updateUI() async {
    ExtractData extractData = ExtractData();
    await extractData.extractIndiaData();
    setState(() {
      totalCase = extractData.totalCases;
      death = extractData.deaths;
      recover = extractData.recovery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFF0ABDE3),
        title: Center(
          child: Text(
            "Corona Cases",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Lobster',
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.00),
                  child: DropdownButton<String>(
                    dropdownColor: Colors.lightBlueAccent.shade50,
                    iconSize: 40.0,
                    elevation: 5,
                    iconEnabledColor: Color(0xFF0ABDE3),
                    items: menu,
                    onChanged: (newvalue) {
                      setState(() {
                        selectedValue = newvalue;
                        typedValue = newvalue;
                        if (typedValue != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MiddleScreen(
                                  typedValue: typedValue,
                                );
                              },
                            ),
                          );
                        }
                      });
                    },
                    focusColor: Color(0xFF0ABDE3),
                    hint: Text("Select State"),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (typedValue != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MiddleScreen(
                                typedValue: typedValue,
                              );
                            },
                          ),
                        );
                      }
                    },
                    child: Icon(
                      Icons.search,
                      size: 40.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Flexible(
                child: Image.asset(
              'images/doctor.jpeg',
              alignment: Alignment.bottomRight,
            )),
            Flexible(
              child: Align(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Container(
                    // alignment: Alignment.bottomCenter,
                    color: Color(0xFF0ABDE3),
                    padding: EdgeInsets.all(15.0),
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text("INDIA", style: style),
                        ),
                        Expanded(
                          child: Text(
                            "Total Corona Cases:$totalCase",
                            style: style,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Deaths:$death",
                            style: style,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Recoveries:$recover",
                            style: style,
                          ),
                        )
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
