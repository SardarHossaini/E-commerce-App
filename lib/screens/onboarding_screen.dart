import 'package:e_commerce_app/screens/login_screen.dart';
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
          image: Image.asset("assets/images/splash1.png", width: 200),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Easy Shopping",
          body: "Browse through thousands of products and find what you need.",
          image: Image.asset("assets/images/splash2.png", width: 200),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fast Delivery",
          body: "Get your products delivered quickly and safely to your doorstep.",
          image: Image.asset("assets/images/splash3.png", width: 200),
          decoration: pageDecoration,
          footer: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(55),
                backgroundColor: Color(0xFFDB3022),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
        ),
      ],
      showSkipButton: false,
      showDoneButton: false,
      showBackButton: true,
      back: Text(
        "Back",
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFDB3022)),
      ),
      next: Text(
        "Next",
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFDB3022)),
      ),
      done: Text(
        "Done",
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFDB3022)),
      ),
      skip: Text(
        "Skip",
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFFDB3022)),
      ),
      onDone: () {
        // When done button is press
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
      },
      onSkip: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
      },
      dotsDecorator: DotsDecorator(
        size: Size.square(10),
        activeSize: Size(20, 10),
        activeColor: Color(0xFFDB3022),
        color: Colors.black26,
        spacing: EdgeInsets.symmetric(horizontal: 3),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
