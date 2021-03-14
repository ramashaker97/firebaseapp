import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
      ),);}}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 0;

  void increment() {
    setState(() {
      number++;
    });
  }
  void descrement() {
    setState(() {number>0?number--:0;
    });
  }
  bool _isFavorited = true;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        backgroundColor: Colors.amber[200],
        body: Column(children: [
        Padding(
        padding: const EdgeInsets.only(top: 40,right: 20,left: 10),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Icon(Icons.arrow_back, color:Colors.white, size: 25),
    Icon(Icons.local_grocery_store, color:Colors.white, size: 25),],
    ),
    ),
    CarouselWithIndicatorDemo(),
    Container(
    width: Get.width*1,
    height: Get.height*0.55,
    decoration:
    BoxDecoration(
    // boxShadow: [
    //   BoxShadow(
    //     color: Colors.grey,
    //     offset: Offset(0.0, 1.0), //(x,y)
    //     blurRadius: 3.0,
    //   ),
    // ],
    borderRadius: BorderRadius.only(topLeft:  Radius.circular(50),topRight:  Radius.circular(50)),
    color: Colors.white),
    child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
    // mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('Mango',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
    SizedBox(height: Get.height*0.001,),
    Text('1 each',style: TextStyle(fontSize: 10,color: Colors.grey),),
    SizedBox(height:Get.height*0.01,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Container(
    height: Get.height*0.05,
    width: Get.width*0.4,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
    color: Colors.grey[100]),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    IconButton(
    onPressed: ()=>{increment(),},
    icon :Icon(
    Icons.add,
    color:Colors.black,
    size: 20),),
    Text('$number'),
    IconButton(
    onPressed: ()=>{descrement()},
    icon :Icon(
    Icons.remove,
    color:Colors.black,
    size: 20),),
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Text('RS 30',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    )
    ],
    ),
      SizedBox(height: Get.height*0.02,),
      Text('Product Description',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      SizedBox(height: Get.height*0.01,),
      Text('A mango is a type of fruit. The mango tree is '
          'native to South Asia, from where it has been'
          'taken to become one on of the most widely'
          'cultivated fruits in the tropics. It is harvested'
          'in the month of march (summer season) till the'
          'end of May.',style: TextStyle(letterSpacing: 2.0, fontSize: 13.0),),
      SizedBox(height: Get.height*0.03,),
      Row(
        children: [
          Container(
            height: Get.height*0.08,
            width: Get.width*0.2,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber[200],style: BorderStyle.solid),
            ),
            child: Center(
              child: IconButton(iconSize: 30,color: Colors.amber[200],
                alignment: Alignment.centerRight,
                icon: (_isFavorited ? Icon(Icons.favorite_outline_sharp) : Icon(Icons.ac_unit)),
                onPressed: _toggleFavorite,
              ),
            ),
          ),
          SizedBox(width: Get.width*0.04,),
          Container(
            height: Get.height*0.08,
            width: Get.width*0.6,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.amber[200],),
            child: Center(child: Text('Add to card',style: TextStyle(fontWeight: FontWeight.bold),)),
          ),


        ],
      )
    ],
    ),
    ),
    )

        ],
        ),
        ),
    );
  }
}



class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final List<String> imgList = [
    "images/bananas.png",
    "images/mango2.png",
    "images/more apple.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imgList.map((item) => Container(width: Get.width*0.35,
          child: Center(child: Image.asset(item.toString())),
        )).toList(),
        options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.map((url) {
          int index = imgList.indexOf(url);
          return Container(
            width: 3,
            height: 3,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? Color.fromRGBO(0, 0, 0, 0.9)
                  : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}