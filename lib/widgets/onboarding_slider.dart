import 'package:flutter/material.dart';
import 'package:github_io/widgets/onboarding_indicator.dart';
import 'package:github_io/widgets/onboarding_pages/page_me_intro.dart';

class OnboardingSlider extends StatefulWidget {
  @override
  _OnboardingSliderState createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _headerWidgets(),
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              PageMeIntro(),
              OnboardingPage(
                title: "Explore",
                description: "Explore the features of our app.",
                imagePath: "assets/images/onboarding2.png",
              ),
              OnboardingPage(
                title: "Get Started",
                description: "Let's get started!",
                imagePath: "assets/images/onboarding3.png",
              ),
            ],
          ),
        ),
        _sliderWidgets(context)
      ],
    );
  }

  Row _sliderWidgets(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.blue,
          disabledElevation: 0,
          onPressed: _previousPage,
          child: Icon(Icons.arrow_left,
              color: Theme.of(context).colorScheme.surface),
        ),
        Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ...List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(4),
                          child: OnboardingIndicator(
                            isActive: index == _currentPage,
                          ),
                        ))
              ],
            )),
        FloatingActionButton(
          backgroundColor: Colors.blue,
          disabledElevation: 0,
          onPressed: _nextPage,
          child: Icon(Icons.arrow_right,
              color: Theme.of(context).colorScheme.surface),
        ),
      ],
    );
  }

  Row _headerWidgets() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('18:35', style: TextStyle(fontSize: 17, color: Colors.white)),
        SizedBox(
          width: 12,
        ),
        Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(
              Icons.message,
              size: 15,
              color: Colors.white,
            )),
        Spacer(),
        Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(
              Icons.headphones,
              size: 15,
              color: Colors.white,
            )),
        SizedBox(
          width: 12,
        ),
        Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(
              Icons.vpn_key,
              size: 15,
              color: Colors.white,
            )),
        Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(
              Icons.network_cell,
              size: 15,
              color: Colors.white,
            )),
        SizedBox(
          width: 12,
        ),
        Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(
              Icons.battery_5_bar,
              size: 15,
              color: Colors.white,
            )),
      ],
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  OnboardingPage(
      {required this.title,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for images if needed
            SizedBox(height: 20),
            Text(title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(description,
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
          ],
        ));
  }
}
