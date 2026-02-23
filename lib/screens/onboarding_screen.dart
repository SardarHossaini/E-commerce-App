import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19),
      bodyPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Welcome to our app",
          body: "Discover amazing products and enjoy exclusive deals.",
          image: Image.asset("assets/images/splash1.png"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Easy Shopping",
          body: "Browse through thousands of products and find what you need.",
          image: Image.asset("assets/images/splash2.png"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fast Delivery",
          body: "Get your products delivered quickly and safely to your doorstep.",
          image: Image.asset("assets/images/splash3.png"),
          decoration: pageDecoration,
        ),
      ],
      showSkipButton: true,
      showDoneButton: true,
      showBackButton: true,
      back: Text(
        "Back",
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFEF6969)),
      ),
      next: Text(
        "Next",
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFEF6969)),
      ),
      done: Text(
        "Done",
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFEF6969)),
      ),
      skip: Text(
        "Skip",
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFEF6969)),
      ),
      onDone: () {
        // When done button is press
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      },
      onSkip: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      },
    );
  }
}
