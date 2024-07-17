import 'package:eventhub/view/onboarding/onboarding_one.dart';
import 'package:eventhub/view/onboarding/onboarding_three.dart';
import 'package:eventhub/view/onboarding/onboarding_two.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../auth/login.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      body: Stack(
        children: [
          // pageview to render all the pages
          PageView(
            //Stops the scroll
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            // check to see if we are on the last page
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [IntroPageOne(), IntroPageTwo(), IntroPageThree()],
          ),

          Container(
            alignment: const Alignment(0, 0.76),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // button to  skip to the last page

                GestureDetector(
                  child: const Text(
                    'Skip',
                  ),
                  onTap: () {
                    controller.jumpToPage(2);
                  },
                ),

                // smooth page indicator to show dots as we navigate the introduction pages
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect:
                      const ExpandingDotsEffect(activeDotColor: Colors.blue),
                ),

                // Button to show next or done depending on which page we are on
                onLastPage
                    ? GestureDetector(
                        child: const Text(
                          'Done',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ));
                        },
                      )
                    : GestureDetector(
                        child: const Text(
                          'Next',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        },
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
