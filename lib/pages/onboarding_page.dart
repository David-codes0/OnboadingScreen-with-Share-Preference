import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding_ui/app_styles.dart';

import 'package:onboarding_ui/models/onboarding_setting.dart';
import 'package:onboarding_ui/models/onboardscreen.dart';
import 'package:onboarding_ui/pages/pages.dart';
import 'package:onboarding_ui/size_configs.dart';
import 'package:onboarding_ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'dart:developer' as devtools;

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(left: 8),
      duration: const Duration(milliseconds: 400),
      height: 8,
      width: currentPage == index ? 24 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? kPurpleColor : kDarkWhiteColor,
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
   
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                itemCount: onBoardingContent.length,
                controller: _pageController,
                onPageChanged: (value) {
                  devtools.log('$sizeVertical');
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OnboardingNavButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                              context
                                  .read<OnboardingSetting>()
                                  .setSeenOnboard();
                            },
                            name: 'Skip',
                            buttonColor: kPurpleColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sizeVertical * 1,
                    ),
                    SizedBox(
                      height: sizeVertical * 50,
                      child: SvgPicture.asset(
                        onBoardingContent[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: sizeVertical * 2,
                    ),
                    Align(
                      child: Text(
                        onBoardingContent[index].title,
                        style: kTitleOnboarding,
                      ),
                    ),
                    SizedBox(
                      height: sizeVertical * 1,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Text(
                          onBoardingContent[index].content,
                          style: kSubtitleOnboarding,
                          maxLines: 3,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeVertical * 5,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    // to make dynamic view based on page position
                    currentPage == onBoardingContent.length - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(
                                  onBoardingContent.length,
                                  (index) => AnimatedContainer(
                                    margin: const EdgeInsets.only(
                                      left: 8,
                                    ),
                                    duration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                      color: kYellowColor,
                                      borderRadius: BorderRadius.circular(8),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ),
                              ),
                              OnboardingNavButton(
                                name: 'Get Started',
                                onPressed: ()  {
                                  _pageController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    curve: Curves.easeInOut,
                                  );
                               
                                },
                                buttonColor: kYellowColor,
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(
                                  onBoardingContent.length,
                                  (index) => dotIndicator(index),
                                ),
                              ),
                              OnboardingNavButton(
                                name: 'Next',
                                onPressed: () async {
                                  _pageController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    curve: Curves.decelerate,
                                  );
                                },
                                buttonColor: kPurpleColor,
                              )
                            ],
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
