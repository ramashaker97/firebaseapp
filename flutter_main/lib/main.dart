
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:Profile()));
}
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return MaterialApp(
        home : Scaffold(
            body : Stack (
              children :[

                Image(
                    image: AssetImage(
                      "assets/2.jpg",
                    )
                ),

                Center(child: CustomCircleAvatar(image_name: 'assets/1.jpg')),
                CustomShapeCircle(),
                CustomShapeCircle2(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top :200),
                    child: Text('Nour Alhamwi',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top :260),
                    child: Text('الحالة',style: TextStyle(fontSize: 15,),),
                  ),
                ),
              ],

            )
        )

    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  final String image_name;
  CustomCircleAvatar({this.image_name});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(
        image_name,
      ),
      radius: 70.0,

    );

  }
}
// ignore: must_be_immutable
class CustomShapeCircle extends StatelessWidget {

  double top;
  double right;
  CustomShapeCircle({
    this.top,
    this.right,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Positioned(
      top: mq.size.height * 0.58,
      right: 115,
      child: Column(
        children: [
          Container(
            height: 40,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Icons.add_a_photo,
            ),
          ),
        ],
      ),
    );
  }
}
// ignore: must_be_immutable
class CustomShapeCircle2 extends StatelessWidget {

  double top;
  double right;
  CustomShapeCircle2({
    this.top,
    this.right,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return Positioned(
      top: mq.size.height * 0.48,
      right: 10,
      child: Column(
        children: [
          Container(
            height: 40,
            width: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Icons.add_a_photo,
            ),
          ),
        ],
      ),
    );
  }

}