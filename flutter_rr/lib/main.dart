import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Color(0xff9884B5)),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            tooltip: 'Back',
            onPressed: null, // null disables the button
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: title,
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Image(
              image: AssetImage("images/imageRich.png"),
              width: 40.0,
              height: 40.0,
            ),
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  String dropdownValue = 'ar';

  @override
  Widget build(BuildContext context) {
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Settings',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),

          Container(
            padding: EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 35.0),
            child: Row(
              children: [
                Text(
                  "Language:",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                SizedBox(
                  width: 50.0,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {},
                  items: <String>['ar', 'en', 'fr', 'dh']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Expanded(
              child: FlatButton(
                padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                onPressed: (){},
                color: Colors.deepPurple,
                child: Row(
                  children: [
                    Icon(Icons.edit,color: Colors.white,size: 30.0,),
                    SizedBox(width: 60.0,),
                    Text("Help to translate",style: TextStyle(color: Colors.white,fontSize: 25.0),),
                  ],
                ),
              ),
            ),
          ),
          Divider(),
          SizedBox(height: 30.0,),
          Text("Other apps of a developer",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
          _buildCarousel(context),
        ],
      ),
    );
  }
}

Widget _buildCarousel(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20.0),
    height: 280.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _buildCarouselItem(context),
        _buildCarouselItem(context),
        _buildCarouselItem(context),
        _buildCarouselItem(context),
        _buildCarouselItem(context),
        _buildCarouselItem(context),
      ],
    ),
  );
}

Widget _buildCarouselItem(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Image(
          image: AssetImage("images/imageRich.png"),
          height: 200.0,
          width: 200.0,
        ),
        Text(
          "App",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          '''App whatsapp free and free  
App whatsapp free and free''',
          maxLines: 2,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}

void main() {
  runApp(MaterialApp(
    title: 'Settings',
    debugShowCheckedModeBanner: false,
    home: SafeArea(
      child: MyScaffold(),
    ),
  ));
}
