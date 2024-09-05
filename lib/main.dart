import 'dart:math';

import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:github_io/widgets/onboarding_slider.dart';
import 'package:particles_flutter/component/particle/particle.dart';
import 'package:particles_flutter/particles_engine.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Color(0xFF212121),
          child: Particles(
            awayRadius: 100,
            particles: _createParticles(),
            height: screenHeight,
            width: screenWidth,
            onTapAnimation: true,
            awayAnimationDuration: const Duration(milliseconds: 100),
            awayAnimationCurve: Curves.linear,
            enableHover: true,
            hoverRadius: 90,
            connectDots: true,
          ),
        ),
        Center(
            child: DeviceFrame(
                device: Devices.ios.iPhone13ProMax,
                screen: Card(
                    elevation: 12,
                    color: Colors.black,
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
                        child:
                            OnboardingSlider(), // Place the onboarding slider here
                      ),
                    ))))
      ]),
    );
  }

  List<Particle> _createParticles() {
    var rng = Random();
    List<Particle> particles = [];
    for (int i = 0; i < 100; i++) {
      particles.add(Particle(
        color: Colors.white.withOpacity(0.6),
        size: rng.nextDouble() * 10,
        velocity: Offset(rng.nextDouble() * 20 * _randomSign(),
            rng.nextDouble() * 30 * _randomSign()),
      ));
    }
    return particles;
  }

  double _randomSign() {
    var rng = Random();
    return rng.nextBool() ? 1 : -1;
  }
}
