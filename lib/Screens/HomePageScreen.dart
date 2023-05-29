import 'package:flutter/material.dart';

import 'dart:math';

import '../widgets/textStyle.dart';

import '../Screens/quizScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _txtController = TextEditingController();
  final Random _generatedNumber = Random();
  bool _flag = false;
  int _num = 1;
  int _counter = 0;
  int _ans = 0;
  int _firstOption = 0;
  int _secondOption = 0;

  int validCheck(){
    if(_txtController.text.isEmpty){
      return 0;
    } 
    return (int.parse(_txtController.text));
  }

  void _randomlyGeneratedNumbers() {
    setState(
      () {
        _counter = _generatedNumber.nextInt(9) + 1;
        _firstOption = _generatedNumber.nextInt(9) + 1;
        _secondOption = _generatedNumber.nextInt(9) + 1;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextStyleWidget(
                    'Please Select A Number Using SliderBar!',
                    Colors.black,
                    17,
                    FontWeight.bold),
                Slider(
                    value: _num.toDouble(),
                    min: 1.0,
                    max: 100.0,
                    activeColor: Colors.yellow,
                    inactiveColor: const Color(0xFF263238),
                    onChanged: (double value) {
                      setState(() {
                        _flag = false;
                        _num = value.round();
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: TextField(
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      // hintText: "Enter A Limit Value Here",
                      label: Text("Enter Limit Value : If it is not entered the table will not be generated! "),
                    ),
                    controller: _txtController,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _flag = true;
                    });
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                  ),
                  child: const Text('Generate A Table !', style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            Text(
              _num.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 200,
              child: _flag
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 1;
                              i <= validCheck();
                              i++)
                            TextStyleWidget('$_num X $i = ${_num * i}',
                                Colors.black, 15, FontWeight.bold),
                        ],
                      ),
                    )
                  : Container(),
            ),
            InkWell(
              hoverColor: Colors.yellow,
              onTap: () {
                setState(
                  () {
                    _randomlyGeneratedNumbers();

                    _ans = _num * _counter;
                    _firstOption = _firstOption * _num;
                    _secondOption = _secondOption * _num;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => quiz(
                            num: _num,
                            counter: _counter,
                            ans: _ans,
                            firstOption: _firstOption,
                            secondOption: _secondOption),
                      ),
                    );
                  },
                );
              },
              child: TextStyleWidget(
                  'Take a Test !', Colors.black, 20, FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            const Center(child: Text("Developed by Shoib Munir" ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 1, color: Colors.black),),)
          ],
        ),
      ),
    );
  }
}
