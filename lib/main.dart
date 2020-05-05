import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      home: Calculator(),
        // appBar: AppBar(title: Text("Calculator by  Nichachawalee Chatwattananon 6035512029")),
    );
  }
}

class Calculator extends StatefulWidget{
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Calculator by Nichachawalee Chatwattananon 6035512029"),),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          buildAnswer(),
        ],)
      )
    );
  }
}

Widget buildAnswer() {
    return Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints.expand(height: 180),
        color: Color(0xffecf0f1),
        child: Align(
            alignment: Alignment.bottomRight,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Text("12", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
            ])));
  }

 