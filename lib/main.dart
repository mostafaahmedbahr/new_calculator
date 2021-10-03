import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String text = "0";
  String result = "";
  String finalResult = "0";
  double numOne = 0;
  double numTwo = 0;
  String opr = "";
  String preOpr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("C", Colors.grey, 1),
                button("+/-", Colors.grey, 1),
                button("%", Colors.grey, 1),
                button("/", Colors.orangeAccent, 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("7", Colors.grey[900], 1),
                button("8", Colors.grey[900], 1),
                button("9", Colors.grey[900], 1),
                button("x", Colors.orangeAccent, 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("4", Colors.grey[900], 1),
                button("5", Colors.grey[900], 1),
                button("6", Colors.grey[900], 1),
                button("-", Colors.orangeAccent, 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("1", Colors.grey[900], 1),
                button("2", Colors.grey[900], 1),
                button("3", Colors.grey[900], 1),
                button("+", Colors.orangeAccent, 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("0", Colors.grey, 0),
                button(".", Colors.grey, 1),
                button("=", Colors.orangeAccent, 1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button(String txt, Color color, int num) {
    Container container;
    if (num == 0) {
      container = Container(
        padding: EdgeInsets.only(bottom: 20),
        child: RaisedButton(
          onPressed: () {
            calculate(txt);
          },
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          color: color,
          padding: EdgeInsets.only(left: 81, top: 20, bottom: 20, right: 81),
          shape: StadiumBorder(),
        ),
      );
    } else {
      container = Container(
        padding: EdgeInsets.only(bottom: 20),
        child: RaisedButton(
          onPressed: () {
            calculate(txt);
          },
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          color: color,
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
        ),
      );
    }
    return container;
  }

  void calculate(txtBtn) {
    if (txtBtn == "C") {
      text = "0";
      result = "0";
      finalResult = "0";
      numOne = 0;
      numTwo = 0;
      opr = "";
      preOpr = "";
    } else if (opr == "=" && txtBtn == "=") {
      switch (preOpr) {
        case "+":
          finalResult = add();
          break;
        case "-":
          finalResult = sub();
          break;
        case "x":
          finalResult = multi();
          break;
        case "/":
          finalResult = div();
          break;
      }
    } else if (txtBtn == "+" || txtBtn == "-" || txtBtn == "x" || txtBtn == "/" || txtBtn == "="||txtBtn=="%") {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }
      switch (opr) {
        case "+":
          finalResult = add();
          break;
        case "-":
          finalResult = sub();
          break;
        case "x":
          finalResult = multi();
          break;
        case "/":
          finalResult = div();
          break;
        case "%":
          finalResult = mod();
          break;
      }
      preOpr = opr;
      opr = txtBtn;
      result = "";
    }
    else if(txtBtn==".")
    {
      if(!result.contains("."))
        result+=".";
      finalResult=result;
    }
    else if(txtBtn=="+/-")
    {
      result.startsWith("-")?result=result.substring(1):result="-"+result;
      finalResult=result;
    }
    else {
      if (result == "0")
        result=txtBtn;
        else
        result = result + txtBtn;
        finalResult = result;
    }
    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String multi() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return result;
  }

  String mod() {
    result = (numOne % numTwo).toString();
    numOne = double.parse(result);
    return result;
  }
}
