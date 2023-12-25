import 'package:flutter/material.dart';
import 'package:tif_assignment/practice/loading_animation_2.dart';
import 'package:tif_assignment/widgets/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TIF Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
        useMaterial3: true,
      ),
      home: const LoadingAnimation2(),
    );
  }
}
