import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../intro_pages/intro_page1.dart';
import '../intro_pages/intro_page2.dart';
import '../intro_pages/intro_page3.dart';
import 'home_page.dart';


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
                  child: const Text('Skip'),
                  onTap: () {
                    controller.jumpToPage(2);
                  },
                ),

                // smooth page indicator to show dots as we navigate the introduction pages
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(),
                ),

                // Button to show next or done depending on which page we are on
                onLastPage
                    ? GestureDetector(
                        child: const Text('Done'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const HomePage();
                            },
                          ));
                        },
                      )
                    : GestureDetector(
                        child: const Text('Next'),
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
