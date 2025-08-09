import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blueAccent,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.black)));

  final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color(0xFFF69D20),
      scaffoldBackgroundColor: Color(0xFF353535),
      textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.white)));

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      title: 'Calculator',
      home: Calculator()));
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String expression = "";
  String data = "";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double buttonBorderRadius = screenHeight * 0.07 - 3;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                height: screenHeight * 0.3,
                width: screenWidth,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(data,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                          fontSize: 45.0)),
                ),
              ),
              Container(
                height: screenHeight * 0.7,
                width: screenWidth,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Calculator buttons line 1///////////////////////////////////
                    SizedBox(
                      height: screenWidth * 0.25 - 6.25,
                      width: screenWidth,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression = "";
                                data = "";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.5 - 7.5,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'AC',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                      fontSize: 35.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (expression.isNotEmpty) {
                                  expression = expression.substring(
                                    0,
                                    expression.length - 1,
                                  );
                                }
                                if (data.isNotEmpty) {
                                  data = data.substring(
                                    0,
                                    data.length - 1,
                                  );
                                }
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.backspace_outlined,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  size: 35.0,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "/";
                                data += "÷";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '÷',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                      fontSize: 40.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Calculator buttons line 2///////////////////////////////////
                    SizedBox(
                      height: screenWidth * 0.25 - 6.25,
                      width: screenWidth,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "7";
                                data += "7";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '7',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "8";
                                data += "8";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '8',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "9";
                                data += "9";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '9',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "*";
                                data += "×";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '×',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                      fontSize: 40.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Calculator buttons line 3///////////////////////////////////
                    SizedBox(
                      height: screenWidth * 0.25 - 6.25,
                      width: screenWidth,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "4";
                                data += "4";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "5";
                                data += "5";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "6";
                                data += "6";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "-";
                                data += "-";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                      fontSize: 40.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Calculator buttons line 4///////////////////////////////////
                    SizedBox(
                      height: screenWidth * 0.25 - 6.25,
                      width: screenWidth,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "1";
                                data += "1";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "2";
                                data += "2";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "3";
                                data += "3";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "+";
                                data += "+";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                      fontSize: 40.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Calculator buttons line 5///////////////////////////////////
                    SizedBox(
                      height: screenWidth * 0.25 - 6.25,
                      width: screenWidth,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += "0";
                                data += "0";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                expression += ".";
                                data += ".";
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.25 - 6.25,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '.',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .color,
                                      fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              ShuntingYardParser p = ShuntingYardParser();
                              Expression exp = p.parse(expression);
                              ContextModel cm = ContextModel();
                              double result =
                                  exp.evaluate(EvaluationType.REAL, cm);

                              setState(() {
                                expression = result.toString();
                                data = expression;
                              });
                            },
                            child: Container(
                              width: screenWidth * 0.5 - 7.5,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(
                                  buttonBorderRadius,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '=',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
