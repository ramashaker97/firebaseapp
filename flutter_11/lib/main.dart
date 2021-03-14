import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("I AM RICH"),
              backgroundColor: Colors.blue,
            ),
            body: Center(
              child: Image(
                image: AssetImage('images/diamond.png'),
              ),
            )));
  }
}
