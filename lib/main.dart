import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      home: Calculator(title: 'Calculator by  Nichachawalee Chatwattananon 6035512029'),
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
  String output1; //ตัวแปรเก็บค่าเพื่อแสดงคำตอบ
  String output2; //ตัวแปรเก็บค่าก่อนคำตอบ
  String num1;  //ใช้คำนวณ
  String operand; //เครื่องหมาย
  bool calculateMode;

  @override
  void initState() {  //กำหนดค่าให้ตัวแปรต่างๆเป็นค่าเริ่มต้น
    output1 = "0";
    operand = "";
    output2 = "";
    num1 = "";
    calculateMode = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
        elevation: 1,
      ),
      body: Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[buildAnswer(), buildButtonClick()],  //เรียก function มาแสดง
      )
      ),
    );
  }

  Widget buildAnswer() { //function ช่องแสดงคำตอบ
    return Expanded(
        child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(16),
            constraints: BoxConstraints.expand(height: 200),
            color: Colors.lightBlue[100], 
            child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(num1 + " ", style: TextStyle(fontSize: 18)),
                      Text(output1,
                          style: TextStyle(
                              fontSize: 48, fontWeight: FontWeight.bold))
                    ]
              )
            )
        )
    );
  }

  Widget buildButtonClick() { //เป็นการแสดงปุ่มตัวเลขและเครื่องหมาย จะใช้ฟังก์ชัน addnumber เพื่อเก็บค่าไปคำนวณ
    return Container(
        color: Colors.redAccent[400],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(children: <Widget>[
              NumberButton("9", onTap: () {
                addNumber(9);
              }),
              NumberButton("8", onTap: () {
                addNumber(8);
              }),
              NumberButton("7", onTap: () {
                addNumber(7);
              }),
              NumberButton("+", numberButton: false, onTap: () {
                addOperand("+");
              }),
            ]),
            Row(children: <Widget>[
              NumberButton("6", onTap: () {
                addNumber(6);
              }),
              NumberButton("5", onTap: () {
                addNumber(5);
              }),
              NumberButton("4", onTap: () {
                addNumber(4);
              }),
              NumberButton("−", numberButton: false, onTap: () {
                addOperand("-");
              }),
            ]),
            Row(children: <Widget>[
              NumberButton("3", onTap: () {
                addNumber(3);
              }),
              NumberButton("2", onTap: () {
                addNumber(2);
              }),
              NumberButton("1", onTap: () {
                addNumber(1);
              }),
              NumberButton("x", numberButton: false, onTap: () {
                addOperand("x");
              }),
            ]),
            Row(children: <Widget>[
              NumberButton("C", numberButton: false, onTap: () {
                clearAll();
              }),
              NumberButton("0", onTap: () {
                addNumber(0);
              }),
              NumberButton("=", numberButton: false, onTap: () {
                calculate();
              }),
              NumberButton("/", numberButton: false, onTap: () {
                addOperand("/");
              }),
            ]
            ),
          ],
        )
        );
  }

  void clearAll() {  //เป็นการเคลียร์ค่า จะทำการ setstate ใหม่
    setState(() {
      output1 = "0";
      num1 = "";
      calculateMode = false;
      operand = "";
    }
    );
  }

  void calculate() {  //function คำนวณ โดยมีเงื่อนไขต่างๆ
    setState(() {
      if (calculateMode) {
        double value = 0;
        String error = "ERROR";
        if (operand == "+") {
          value = (double.parse(output2) + double.parse(output1));
          output1 = value.toInt().toString();
        } 
        else if (operand == "-") {
          value = (double.parse(output2) - double.parse(output1));
          output1 = value.toInt().toString();
        } 
        else if (operand == "x") {
          value = (double.parse(output2) * double.parse(output1));
          output1 = value.toInt().toString();
        } 
        else if (operand == "/" && double.parse(output1) == 0) { 
          output1 = (error);                                              //ถ้ามีหาร 0 ให้แสดง error
        } 
        else if (operand == "/") {
          value = (double.parse(output2) / double.parse(output1));
          output1 = value.toInt().toString();
        }
        calculateMode = false;
        operand = "";
        output2 = "";
        num1 = "";
      }
    }
    );
  }

  void addOperand(String op) {  //เพิ่มเครื่องหมายจากการกด
    setState(() {
      if (output1 != "0" && !calculateMode) {
        calculateMode = true;
        output2 = output1;
        num1 += operand + " " + output2;
        operand = op;
        output1 = "0";
      } else if (calculateMode) {
        if (output1.isNotEmpty) {
          calculate();
          output2 = output1;
          num1 = "";
          operand = "";
        } else {
          operand = op;
        }
      }
    }
    );
  }

  void addNumber(int number) { 
    setState(() {
      if (number == 0 && output1 == "0") {
      } 
      else if (number != 0 && output1 == "0") {
        output1 = number.toString();
      } 
      else {
        output1 += number.toString();
      }
    }
    );
  }

  Widget NumberButton(String str, {@required Function() onTap, bool numberButton = true}) {
    Widget widget;
    if (numberButton) {  //เงื่อนไขตรวจสอบปุ่ม ถ้าเข้ามาเป็นตัวเลข
      widget = Container(
          margin: EdgeInsets.all(1),
          child: Material(
              color: Colors.blue[800],
              child: InkWell(
                  onTap: onTap,
                  //splashColor: Colors.cyanAccent,
                  child: Container(
                      height: 70,
                      child: Center(
                          child: Text(str,
                              style: TextStyle(
                                fontSize: 28,
                              )
                          )
                      )
                   )                        
              )
           )
       );
    } else {  //ถ้าไม่ใช่ให้ทำในนี้ ก็จะเป็นพวกเครื่องหมายที่เข้าเงื่อนไข else
      widget = Container(
          margin: EdgeInsets.all(1),
          child: Material(
              color: Colors.blue[600],
              child: InkWell(
                  onTap: onTap,
                  splashColor: Colors.cyan,
                  child: Container(
                      height: 70,
                      child: Center(
                          child: Text(str,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold)))))));
    }

    return Expanded(child: widget);
  }
}


  // buttonPressed(String buttonText){ //function
  //   if(buttonText == "Clear"){
  //     output2 = "0";
  //     num1 = 0.0;
  //     num2 = 0.0;
  //     operand = "";
  //   } else if(buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/"){
  //     num1 = double.parse(output1);
  //     operand = buttonText;
  //     output2 = "0";
  //   }
  //   else if(buttonText == "."){
  //       if(output1.contains(".")){
  //       output2 = output2 + buttonText;
  //       print(output2);
  //       return;
  //       } else {
  //           output2 = output2 + buttonText;
  //       }
  //   }
  //   else if(buttonText == "="){
  //     num2 = double.parse(output1);

  //     if(operand == "+"){
  //       output2 = (num1 + num2).toString();
  //     }

  //     if(operand == "-"){
  //       output2 = (num1 - num2).toString();
  //     }

  //     if(operand == "x"){
  //       output2 = (num1 * num2).toString();
  //     }
      
  //     if(operand == "/"){
  //       output2 = (num1 / num2).toString();
  //     }

  //   num1 = 0.0;
  //   num2 = 0.0;
  //   operand = "";

  // } else {
  //   output2 = output2 + buttonText;
  // }

  // print(output2);

  // setState(() { //เป้นตัวทำให้ output 2 เท่ากับ output1
  //   output1 = double.parse(output2).toStringAsFixed(2);
  // });
  // }

//  Widget buildButton(String buttonText){
//    return Expanded(
//      child: OutlineButton(
//        padding: EdgeInsets.all(25),
//        child: Text(buttonText,
//        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
//        ),
//        onPressed: () => buttonPressed(buttonText),
//        ),
//      );
//  }

//   @override 
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(title: Text("Calculator by Nichachawalee Chatwattananon 6035512029"),),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           //mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//           buildAnswer(),
//         ],)
//       )
//     );
//   }
// }

//   @override 
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Calculator by Nichachawalee Chatwattananon 6035512029"),),
//       body: Container(
//         child: Column(
//           //crossAxisAlignment: CrossAxisAlignment.start,
//           //mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
// //============================
//             Container(
//               alignment: Alignment.centerRight,
//               padding: EdgeInsets.symmetric(vertical: 25, horizontal: 13),
//               child: Column(
//               mainAxisSize: MainAxisSize.min, 
//               children: <Widget>[
//               Text("12", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
// //=============================
//             Expanded(
//               child: Divider(), //เส้นตัด
//             ),
// //===========================
//             Column(
//               children: <Widget>[
//                 Row(children: <Widget>[
//                   buildButton("9"),
//                   buildButton("8"),
//                   buildButton("7"),
//                   buildButton("+"),
//                 ],
//                 ),

//                 Row(children: <Widget>[
//                   buildButton("9"),
//                   buildButton("8"),
//                   buildButton("7"),
//                   buildButton("+"),
//                 ],
//                 ),

//                 Row(children: <Widget>[
//                   buildButton("6"),
//                   buildButton("5"),
//                   buildButton("4"),
//                   buildButton("-"),
//                 ],
//                 ),

//                 Row(children: <Widget>[
//                   buildButton("3"),
//                   buildButton("2"),
//                   buildButton("1"),
//                   buildButton("x"),
//                 ],
//                 ),

//                 Row(children: <Widget>[
//                   buildButton("c"),
//                   buildButton("0"),
//                   buildButton("="),
//                   buildButton("/"),
//                 ],
//                 ),
//               ],
//               )
//               ],
//               ),
//             ),
//           ],
//         ),
//       )
//     );  
//   }
// }
