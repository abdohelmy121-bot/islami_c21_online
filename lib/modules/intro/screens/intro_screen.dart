import 'package:flutter/material.dart';
import 'package:islamic_c21_online/core/theme/app_colors.dart';
import 'package:islamic_c21_online/modules/layout/screens/layout_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<String> intro = [
    "assets/images/Intro Screen.png",
    "assets/images/Intro Screen-1.png",
    "assets/images/Intro Screen-2.png",
    "assets/images/Intro Screen-3.png",
    "assets/images/Intro Screen-4.png",
  ];

  final PageController controller = PageController();

  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  selectedindex = value;
                  setState(() {});
                },
                controller: controller,
                itemCount: intro.length,
                itemBuilder: (context, index) {
                  return Image.asset(intro[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (selectedindex != 0) ...[
                  TextButton(
                    onPressed: () {
                      controller.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: AppColors.gold,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ] else
                  SizedBox(width: 60, height: 30),
                SmoothPageIndicator(
                  controller: controller,
                  count: 5,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.gold,
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 3,
                    spacing: 12,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (selectedindex == 4) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LayoutScreen();
                          },
                        ),
                      );
                    }
                    controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: AppColors.gold,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
