import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingAnimation2 extends StatefulWidget {
  const LoadingAnimation2({super.key});

  @override
  State<LoadingAnimation2> createState() => _LoadingAnimation2State();
}

class _LoadingAnimation2State extends State<LoadingAnimation2> {
  List<bool> toggle = List.generate(50, (index) => false);

  //Timer
  Timer? _timer;
  int _timerValue = 0;

  void startTimer() {
    Duration duration = const Duration(milliseconds: 500);
    _timer = Timer.periodic(duration, (Timer timer) {
      setState(() {
        if (_timerValue == 100) {
          _timer?.cancel();
        } else {
          _timerValue += 1;
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> frame1 = [
      27,
      28,
      34,
      37,
      42,
      45,
      51,
      52,
      66,
      67,
      68,
      69,
      73,
      78,
      73,
      78,
      81,
      86,
      89,
      94,
    ];
    List<int> frame2 = [
      27,
      28,
      34,
      37,
      42,
      45,
      51,
      52,
      74,
      75,
      76,
      77,
      81,
      86,
      89,
      94,
    ];
    List<int> frame3 = [
      27,
      28,
      35,
      36,
      43,
      44,
      74,
      75,
      76,
      77,
      81,
      86,
      89,
      94,
    ];
    List<List<int>> frames = [
      frame1,
      frame2,
      frame3,
      frame1,
      frame1,
      frame1,
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          Color clr = Colors.white.withOpacity(0.3);
          List currentFrame = frames[_timerValue % 6];
          if (currentFrame.contains(index)) {
            clr = const Color(0xffFF993A);
          }
          if (currentFrame.contains(index + 8) &&
              !currentFrame.contains(index)) {
            clr = const Color(0xffFF993A).withOpacity(0.5);
          }
          if (currentFrame.contains(index - 8) &&
              !currentFrame.contains(index)) {
            clr = const Color(0xffFF993A).withOpacity(0.5);
          }
          if (currentFrame.contains(index + 1) &&
              !currentFrame.contains(index)) {
            clr = const Color(0xffFF993A).withOpacity(0.5);
          }
          if (currentFrame.contains(index - 1) &&
              !currentFrame.contains(index)) {
            clr = const Color(0xffFF993A).withOpacity(0.5);
          }
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              color: clr,
              boxShadow: [
                currentFrame.contains(index)
                    ? BoxShadow(
                        color: const Color(0xffFF993A).withOpacity(1),
                        spreadRadius: 3,
                        blurRadius: 15,
                      )
                    : const BoxShadow()
              ],
              borderRadius: BorderRadius.circular(100),
            ),
          )
              .animate(
                target: currentFrame.contains(index) ? 1 : 0,
              )
              .scaleXY(
                begin: 0.1,
                end: 0.4,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastEaseInToSlowEaseOut,
              );
        },
      ),
    );
  }
}
