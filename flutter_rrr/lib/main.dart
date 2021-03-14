import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp());
}

class Counter extends StatefulWidget {
  const Counter();

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  Color c;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('blue'),
                  color: c,
                ),
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        if (c == Colors.blue) {
                          c = Colors.red;
                        } else {
                          c = Colors.blue;
                        }
                      });
                    })
              ],
            ),
          )),
    );
  }
}
