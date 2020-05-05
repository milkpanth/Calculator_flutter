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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text("Calculator"),
        ],)
      )
    );
  }
}