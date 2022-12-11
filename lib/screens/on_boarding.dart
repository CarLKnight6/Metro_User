import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:taxi_user/screens/splash_screen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final List<OnBoardModel> onBoardData = [
    const OnBoardModel(
      title: "WELCOME",
      description:
          "Thanks for choosing us for your transportation needs. We're here to make your ride stress-free.",
      imgUrl: "assets/images/Slider 1.png",
    ),
    const OnBoardModel(
      title: "BOOK NOW",
      description:
          'The "BOOK NOW" feature in our taxi booking app allows users to quickly and easily book a taxi for immediate pickup.',
      imgUrl: 'assets/images/Slider 2.png',
    ),
    const OnBoardModel(
      title: "ADVANCE BOOKING",
      description:
          "The advance booking feature in our taxi booking app allows users to schedule a ride in advance.",
      imgUrl: 'assets/images/Slider 3.png',
    ),
    const OnBoardModel(
      title: "BOOK A FRIEND",
      description:
          'The "BOOK A FRIEND" feature in our taxi booking app allows users to easily share their ride with a friend or family member.',
      imgUrl: 'assets/images/Slider 4.png',
    ),
  ];

  final PageController _pageController = PageController();

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
        pageController: _pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state

        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoadingScreenToLogIn()));
        },
        onBoardData: onBoardData,
        titleStyles: TextStyle(
          fontFamily: 'QBold',
          color: Colors.red[600]!,
          fontSize: 18,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.15,
        ),
        descriptionStyles: TextStyle(
          fontFamily: 'QRegular',
          fontSize: 16,
          color: Colors.brown.shade300,
        ),
        pageIndicatorStyle: PageIndicatorStyle(
          width: 100,
          inactiveColor: Colors.red[600]!,
          activeColor: Colors.red[600]!,
          inactiveSize: const Size(8, 8),
          activeSize: const Size(12, 12),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LoadingScreenToLogIn()));
          },
          child: Text(
            "Skip",
            style: TextStyle(
              fontFamily: 'QRegular',
              color: Colors.red[600]!,
            ),
          ),
        ),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => state.isLastPage
                  ? Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoadingScreenToLogIn()))
                  : _onNextTap(state),
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [Colors.red[600]!, Colors.red[600]!],
                  ),
                ),
                child: Text(
                  state.isLastPage ? "Done" : "Next",
                  style: const TextStyle(
                    fontFamily: 'QRegular',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
