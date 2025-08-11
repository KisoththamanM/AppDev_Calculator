import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String expression = "";
  String data = "";
  bool isLight = true;
  double _width = 25.0;

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
  ThemeMode theme = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double buttonBorderRadius = screenHeight * 0.07 - 3;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: theme,
        title: 'Calculator',
        home: Builder(builder: (context) {
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
                    Stack(children: [
                      Container(
                        padding: EdgeInsets.all(5.0),
                        height: screenHeight * 0.3,
                        width: screenWidth,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(data,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
                                  fontSize: 45.0)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 80.0,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _width = _width == 25.0 ? 48.0 : 25.0;
                                      isLight = !isLight;
                                      theme = theme == ThemeMode.light
                                          ? ThemeMode.dark
                                          : ThemeMode.light;
                                    });
                                  },
                                  child: Container(
                                    height: 25.0,
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.black54,
                                        border: Border.all(
                                            color: Colors.black, width: 1.0)),
                                    child: Row(
                                      children: [
                                        AnimatedContainer(
                                          duration: Duration(milliseconds: 400),
                                          height: 25.0,
                                          width: _width,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Icon(
                                  isLight
                                      ? Icons.light_mode_outlined
                                      : Icons.dark_mode_outlined,
                                  color: isLight ? Colors.black : Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
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
                                Container(
                                  width: screenWidth * 0.5 - 7.5,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(
                                      buttonBorderRadius,
                                    ),
                                  ),
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression = "";
                                        data = "";
                                      });
                                    },
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
                                Container(
                                  width: screenWidth * 0.25 - 6.25,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(
                                      buttonBorderRadius,
                                    ),
                                  ),
                                  child: CupertinoButton(
                                    onPressed: () {
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
                                Container(
                                  width: screenWidth * 0.25 - 6.25,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(
                                      buttonBorderRadius,
                                    ),
                                  ),
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "/";
                                        data += "÷";
                                      });
                                    },
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
                                Container(
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
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "7";
                                        data += "7";
                                      });
                                    },
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
                                Container(
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
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "8";
                                        data += "8";
                                      });
                                    },
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
                                Container(
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
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "9";
                                        data += "9";
                                      });
                                    },
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
                                Container(
                                  width: screenWidth * 0.25 - 6.25,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(
                                      buttonBorderRadius,
                                    ),
                                  ),
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "*";
                                        data += "×";
                                      });
                                    },
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
                                Container(
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
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "4";
                                        data += "4";
                                      });
                                    },
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
                                Container(
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
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "5";
                                        data += "5";
                                      });
                                    },
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
                                Container(
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
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "6";
                                        data += "6";
                                      });
                                    },
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
                                Container(
                                  width: screenWidth * 0.25 - 6.25,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(
                                      buttonBorderRadius,
                                    ),
                                  ),
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "-";
                                        data += "-";
                                      });
                                    },
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
                                Container(
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
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "1";
                                        data += "1";
                                      });
                                    },
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
                                Container(
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
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "2";
                                        data += "2";
                                      });
                                    },
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
                                Container(
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
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "3";
                                        data += "3";
                                      });
                                    },
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
                                Container(
                                  width: screenWidth * 0.25 - 6.25,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(
                                      buttonBorderRadius,
                                    ),
                                  ),
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "+";
                                        data += "+";
                                      });
                                    },
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
                                Container(
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
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += "0";
                                        data += "0";
                                      });
                                    },
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
                                Container(
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
                                  child: CupertinoButton(
                                    onPressed: () {
                                      setState(() {
                                        expression += ".";
                                        data += ".";
                                      });
                                    },
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
                                Container(
                                  width: screenWidth * 0.5 - 7.5,
                                  decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.circular(
                                      buttonBorderRadius,
                                    ),
                                  ),
                                  child: CupertinoButton(
                                    onPressed: () {
                                      ShuntingYardParser p =
                                          ShuntingYardParser();
                                      Expression exp = p.parse(expression);
                                      ContextModel cm = ContextModel();
                                      double result =
                                          exp.evaluate(EvaluationType.REAL, cm);

                                      setState(() {
                                        expression = result.toString();
                                        data = expression;
                                      });
                                    },
                                    child: Center(
                                      child: Text(
                                        '=',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30.0),
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
        }));
  }
}
