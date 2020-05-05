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
  Calculator({Key key, this.title}) : super(key: key);
  final String title;
  @override 
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator>{
  String output1 = "0";
  String output2 = "0";
  double num1 = 0.0; //ใช้คำนวณ
  double num2 = 0.0; //ใช้คำนวน
  String operand = ""; 

  buttonClick(String buttonText){ //function

  }

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
      alignment: Alignment.centerRight,
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints.expand(height: 200),
        color: Colors.lightBlueAccent[100],
        child: Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: <Widget>[
              Text("12", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
            ]))
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  buildButton("9"),
                  buildButton("8"),
                  buildButton("7"),
                  buildButton("+"),
                ],
                ),

                Row(children: <Widget>[
                  buildButton("9"),
                  buildButton("8"),
                  buildButton("7"),
                  buildButton("+"),
                ],
                ),

                Row(children: <Widget>[
                  buildButton("6"),
                  buildButton("5"),
                  buildButton("4"),
                  buildButton("-"),
                ],
                ),

                Row(children: <Widget>[
                  buildButton("3"),
                  buildButton("2"),
                  buildButton("1"),
                  buildButton("x"),
                ],
                ),

                Row(children: <Widget>[
                  buildButton("c"),
                  buildButton("0"),
                  buildButton("="),
                  buildButton("/"),
                ],
                ),

              ],
              );
}

 Widget buildButton(String buttonText){
   return Expanded(
     child: OutlineButton(
       padding: EdgeInsets.all(25),
       child: Text(buttonText,
       style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
       ),
       onPressed: () => buttonClick(buttonText), //เรียกใช้ฟังก์ชัน
       )
     );
 }