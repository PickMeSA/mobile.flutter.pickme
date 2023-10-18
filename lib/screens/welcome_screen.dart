import 'package:app/features/login/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/palette.dart';
import '../widgets/buttons.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  var currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  _page('assets/images/welcome_1.png', 'We provide\nprofessional service\nat a friendly price'),
                  _page('assets/images/welcome_2.png', 'The best results and\nyour satisfaction is\nour top priority'),
                  _page('assets/images/welcome_3.png', 'Let\'s make\nawesome changes\nto your home'),
                ],
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                    width: 32,
                    height: 8,
                    color: Palette.green,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  dotDecoration: DotDecoration(
                    width: 8,
                    height: 8,
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  spacing: 6.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: GestureDetector(
                  onTap: () {
                    currentPage != 2
                        ? setState(() {
                            _pageController.animateToPage(
                              currentPage + 1,
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeOutSine,
                            );
                          })
                        : Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                  child: greenButton(label: currentPage != 2 ? 'Next' : 'Get Started')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _page(String image, String text) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Image.asset(
              image,
              width: MediaQuery.of(context).size.width * 0.75,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
