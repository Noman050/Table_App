// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'dart:math';

import 'package:rflutter_alert/rflutter_alert.dart';

import '../main.dart';

import '../widgets/textStyle.dart';

// ignore: camel_case_types
class quiz extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const quiz({
    Key? key,
    this.num,
    this.counter,
    this.ans,
    this.firstOption,
    this.secondOption,
  });
  final num;
  final counter;
  final ans;
  final firstOption;
  final secondOption;

  @override
  // ignore: library_private_types_in_public_api
  _quizState createState() => _quizState();
}

// ignore: camel_case_types
class _quizState extends State<quiz> {
  List<int> options = [];
  late int num = widget.num;
  late int counter = widget.counter;
  late int ans = widget.ans;
  late int firstOption = widget.firstOption;
  late int secondOption = widget.secondOption;
  late int op1, op2, op3;
  late int choosen;
  @override
  initState() {
    options.add(ans);
    options.add(firstOption);
    options.add(secondOption);
    options.shuffle();
    op1 = options.elementAt(0);
    op2 = options.elementAt(1);
    op3 = options.elementAt(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            TextStyleWidget("Test Screen", Colors.black, 20, FontWeight.bold),
        centerTitle: true,
        backgroundColor: Colors.yellow[500],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextStyleWidget("Take Test", Colors.black, 20, FontWeight.bold),
              TextStyleWidget(
                  '$num X $counter = _____', Colors.black, 20, FontWeight.bold),
              Column(
                children: [
                  TextStyleWidget("Choose One Of The Given Options !",
                      Colors.black, 15, FontWeight.bold),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          choosen = op1;
                          if (choosen == ans) {
                            Alert(
                              context: context,
                              type: AlertType.success,
                              desc: "Correct Answer",
                            ).show();
                          } else {
                            Alert(
                              context: context,
                              type: AlertType.error,
                              desc: "Wrong Answer",
                            ).show();
                          }
                        },
                        child: Container(
                          height: 60,
                          width: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Colors.yellow,
                          ),
                          child: Center(
                            child: TextStyleWidget(
                                '$op1', Colors.black, 20, FontWeight.normal),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          choosen = op2;
                          if (choosen == ans) {
                            Alert(
                              context: context,
                              type: AlertType.success,
                              desc: "Correct Answer",
                            ).show();
                          } else {
                            Alert(
                              context: context,
                              type: AlertType.error,
                              desc: "Wrong Answer",
                            ).show();
                          }
                        },
                        child: Container(
                          height: 60,
                          width: 80,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.yellow),
                          child: Center(
                            child: TextStyleWidget(
                                '$op2', Colors.black, 20, FontWeight.normal),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          choosen = op3;
                          if (choosen == ans) {
                            Alert(
                              context: context,
                              type: AlertType.success,
                              desc: "Correct Answer",
                            ).show();
                          } else {
                            Alert(
                              context: context,
                              type: AlertType.error,
                              desc: "Wrong Answer",
                            ).show();
                          }
                        },
                        child: Container(
                          height: 60,
                          width: 80,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.yellow),
                          child: Center(
                            child: TextStyleWidget(
                                '$op3', Colors.black, 20, FontWeight.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()));
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.yellow),
                      child: Center(
                        child: TextStyleWidget(
                            '< New Table', Colors.black, 15, FontWeight.bold),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Random generatedNumber = Random();

                      counter = generatedNumber.nextInt(9) + 1;
                      ans = num * counter;
                      firstOption = generatedNumber.nextInt(9) + 1 * num;
                      secondOption = generatedNumber.nextInt(9) + 1 * num;

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => quiz(
                                  num: num,
                                  counter: counter,
                                  ans: ans,
                                  firstOption: firstOption,
                                  secondOption: secondOption)));
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.yellow),
                      child: Center(
                        child: TextStyleWidget(
                            'Next Test >', Colors.black, 15, FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
