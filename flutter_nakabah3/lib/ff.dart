import 'package:flutter/material.dart';

class Rama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:  FlatButton(child: Text ('uyfgouy', ),onPressed: ()
          {
            print('hi');
          },
          color: Colors.blueGrey,

        ),
      ),
      color: Colors.black,

    );
  }
}

