import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ISuck extends StatefulWidget {
  const ISuck({super.key});

  @override
  State<ISuck> createState() => _ISuckState();
}

class _ISuckState extends State<ISuck> {
  bool toggle = false;
  String text = 'Wow';
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Animate(
          onComplete: (controller) {
            controller.reverse();
            setState(() {
              toggle = !toggle;
            });
          },
          autoPlay: true,
          target: toggle ? 0 : 1,
          effects: const [
            MoveEffect(
              begin: Offset(0, 0),
              end: Offset(0, 100),
              duration: Duration(milliseconds: 700),
              transformHitTests: true,
              curve: Curves.easeInQuart,
            ),
          ],
          child: SvgPicture.asset('lib/assets/basketball.svg'),
        ),
      ),
    );
  }
}
