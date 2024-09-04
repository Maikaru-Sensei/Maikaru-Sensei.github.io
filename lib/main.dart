import 'package:flutter/material.dart';
import 'package:github_io/widgets/onboarding_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Michael',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        ),
        primarySwatch: Colors.blue,
      ),
      color: Colors.black,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 400,
        height: 600,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black, width: 5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: OnboardingSlider(), // Place the onboarding slider here
        ),
      )),
    );
  }
}
