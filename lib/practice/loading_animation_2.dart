import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingAnimation2 extends StatefulWidget {
  const LoadingAnimation2({super.key});

  @override
  State<LoadingAnimation2> createState() => _LoadingAnimation2State();
}

class _LoadingAnimation2State extends State<LoadingAnimation2> {
  List<bool> toggle = List.generate(50, (index) => false);
  List<Color> colorList = [
    Colors.green,
    Colors.purple,
    Colors.amber,
  ];

  //Timer
  int _randomValue = 0;

  void startTimer() {
    Duration duration = const Duration(milliseconds: 400);
    Timer.periodic(duration, (Timer timer) {
      setState(() {
        _randomValue = Random().nextInt(50);
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => setState(() {
          toggle[_randomValue] = true;
        }),
        child: GridView.builder(
          itemCount: 50,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                color: _randomValue == index
                    ? colorList[_randomValue % 3]
                    : Colors.blue,
                borderRadius:
                    BorderRadius.circular(_randomValue == index ? 100 : 5),
              ),
            )
                .animate(
                  target: _randomValue == index ? 1 : 0,
                  onComplete: (controller) => setState(() {
                    controller.reverse();
                    toggle[_randomValue] = false;
                  }),
                )
                .scaleXY(
                  begin: 0.1,
                  end: 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastEaseInToSlowEaseOut,
                );
          },
        ),
      ),
    );
  }
}
