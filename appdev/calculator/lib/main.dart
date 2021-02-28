import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Calci(),
    );
  }
}

class Calci extends StatefulWidget {
  @override
  _CalciState createState() => _CalciState();
}

class _CalciState extends State<Calci> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFS = 50.0;
  double resultFS = 35.0;
  var col = Color(0x212121);
  var white = Colors.white;
  var yel = Colors.yellow.shade600;

  bool parentheses = true;
  buttonPressed(String buttonText) {
    setState(() {
      if (result == '0' || equation == '0') parentheses = true;
      if (equation.length > 22) {
        equationFS = 40;
        resultFS = 30;
      }
      if (equation.length > 28) {
        equationFS = 35;
        resultFS = 25;
      }
      if (equation.length > 34) {
        equationFS = 30;
        resultFS = 15;
      }
      if (equation.length > 40) equationFS = 25;
      if (equation.length > 46) equationFS = 20;

      if (buttonText == "AC") {
        equation = "0";
        result = "";
        equationFS = 38.0;
        resultFS = 0.0;
      } else if (buttonText == "⌫") {
        equationFS = 38.0;
        resultFS = 48.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "" || equation == "0") {
          equation = "0";
          result = "";
          parentheses = true;
        }
      } else if (buttonText == "( )") {
        if (parentheses)
          equation = equation + "×(";
        else
          equation = equation + ")";
        parentheses = !parentheses;
      } else if (buttonText == "=") {
        equationFS = 50.0;
        resultFS = 38.0;
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        if (equation[0] == '0')
          equation = equation.substring(1, equation.length);
        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = new ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          var temp = result;

          result = equation;
          equation = temp;
        } catch (e) {
          result = "Error";
        }
      } else {
        equation = equation + buttonText;
        if (equation[0] == '0')
          equation = equation.substring(1, equation.length);
      }
    });
  }

  Widget customButton(String buttonText, double buttonHeight, Color buttonColor,
      Color txtcolor) {
    return Container(
      height: MediaQuery.of(context).size.height * buttonHeight * 0.1,
      color: buttonColor,
      margin: EdgeInsets.all(0.7),
      child: FlatButton(
        splashColor: Colors.white38,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.normal, color: txtcolor),
        ),
        onPressed: () => buttonPressed(buttonText),
        color: buttonColor,
        padding: EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text('Calculator', style: TextStyle(fontSize: 26)),
        ),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Icon(
              Icons.history,
              color: Colors.amber,
              size: 35,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Divider(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 18, left: 18, bottom: 10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      result,
                      style:
                          TextStyle(color: Colors.white70, fontSize: resultFS),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 18, left: 18),
                    alignment: Alignment.centerRight,
                    child: Text(
                      equation,
                      style:
                          TextStyle(color: Colors.white, fontSize: equationFS),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Material(
              elevation: 20,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Divider(
                    height: 1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Table(
                      children: [
                        TableRow(children: [
                          customButton("AC", 1, col, white),
                          customButton("⌫", 1, col, white),
                          customButton("%", 1, col, white),
                        ]),
                        TableRow(children: [
                          customButton("7", 1, col, white),
                          customButton("8", 1, col, white),
                          customButton("9", 1, col, white),
                        ]),
                        TableRow(children: [
                          customButton("4", 1, col, white),
                          customButton("5", 1, col, white),
                          customButton("6", 1, col, white),
                        ]),
                        TableRow(children: [
                          customButton("1", 1, col, white),
                          customButton("2", 1, col, white),
                          customButton("3", 1, col, white),
                        ]),
                        TableRow(children: [
                          customButton(".", 1, col, white),
                          customButton("0", 1, col, white),
                          customButton("( )", 1, col, white),
                        ])
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Table(
                      children: [
                        TableRow(children: [customButton("÷", 1, col, yel)]),
                        TableRow(children: [customButton("+", 1, col, yel)]),
                        TableRow(children: [customButton("-", 1, col, yel)]),
                        TableRow(children: [customButton("×", 1, col, yel)]),
                        TableRow(children: [
                          customButton("=", 1, Colors.amber, white)
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
