import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressIndicator extends StatefulWidget {
  const ProgressIndicator({super.key});

  @override
  State<ProgressIndicator> createState() => _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator> {
  int animationDuration = 400;
  double scaleVar = 0;
  bool toggle = true;
  bool toggle2 = false;

  //Timer
  Timer? _timer;
  Random _random = Random();
  int _randomValue = 0;

  void startTimer() {
    const duration = Duration(milliseconds: 100);
    _timer = Timer.periodic(duration, (Timer timer) {
      setState(() {
        if (scaleVar >= 300) {
          _timer?.cancel();
          setState(() {
            toggle2 = true;
          });
        } else {
          _randomValue = _random.nextInt(200);
          if (_randomValue % 2 == 0) {
            scaleVar += 8;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                toggle = false;
                _timer?.cancel();

                startTimer();
              }),
              child: Text(
                toggle
                    ? 'Start Animation'
                    : '${min(100, (scaleVar / 3)).toString().split('.').first}% done',
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
                .animate(
                  target: toggle ? 0 : 1,
                )
                .moveY(
                  begin: 0,
                  end: 250,
                ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeOutBack,
              height: scaleVar,
              width: scaleVar,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
            )
                .animate(
                  target: scaleVar >= 300 ? 1 : 0,
                )
                .scaleXY(
                  begin: 1,
                  end: 5,
                ),
          ],
        ),
      ),
    );
  }
}
