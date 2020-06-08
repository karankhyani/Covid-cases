import 'package:flutter/material.dart';
import 'screens/LoadingScreen.dart';
void main(){
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: LoadingScreen(val: 'None',),
      
    );
  }
}