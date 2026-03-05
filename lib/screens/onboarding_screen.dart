import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<_OnboardingData> _pages = const [
    _OnboardingData(
      imagePath: 'assets/images/splash1.png',
      title: 'Discover Trendy Collections',
      subtitle: 'Explore handpicked products for fashion, lifestyle, and everyday essentials.',
    ),
    _OnboardingData(
      imagePath: 'assets/images/splash2.png',
      title: 'Seamless Shopping Experience',
      subtitle: 'Add to cart, manage favorites, and checkout in seconds with a smooth interface.',
    ),
    _OnboardingData(
      imagePath: 'assets/images/splash3.png',
      title: 'Fast & Reliable Delivery',
      subtitle:
          'Track your order in real-time and get your items delivered safely to your doorstep.',
    ),
  ];

  bool get _isLastPage => _currentIndex == _pages.length - 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToLogin() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  void _nextPage() {
    if (_isLastPage) {
      _goToLogin();
      return;
    }

    _pageController.nextPage(duration: const Duration(milliseconds: 280), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFDB3022);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'DP SHOP',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, letterSpacing: 0.7),
                  ),
                  TextButton(
                    onPressed: _goToLogin,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 8),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28),
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFCEAE8), Color(0xFFFFF7F6)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Hero(
                              tag: page.imagePath,
                              child: Image.asset(page.imagePath, fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            height: 1.2,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1C2230),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          page.subtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.45,
                            color: Color(0xFF6C7484),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: List.generate(_pages.length, (index) {
                        final isActive = index == _currentIndex;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          margin: const EdgeInsets.only(right: 8),
                          width: isActive ? 26 : 9,
                          height: 9,
                          decoration: BoxDecoration(
                            color: isActive ? primaryColor : const Color(0xFFD0D5DD),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 54,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                      ),
                      child: Text(
                        _isLastPage ? 'Get Started' : 'Next',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingData {
  final String imagePath;
  final String title;
  final String subtitle;

  const _OnboardingData({required this.imagePath, required this.title, required this.subtitle});
}
