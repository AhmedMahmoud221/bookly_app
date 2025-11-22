import 'package:bookly_app/Features/Splash/presentation/views/widgets/sliding_text.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
    // slidingAnimation.addListener(() {   (we don't need this code becuse used AnimatedBuilder)
    //   setState(() {});
    // });

    navigateToHome(); // This is Navigate to the  HomePage by transtionDuration
  }

  @override
  void dispose() {
    super.dispose();

    animationController
        .dispose(); //Unsubscribe from streams and close network connections to avoid memory leaks and ensure the application functions efficiently.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 5),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Timer Animathion
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 5), // Position Animation Start & End
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
    // slidingAnimation.addListener(() {   (we don't need this code becuse used AnimatedBuilder)
    //   setState(() {});
    // });
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(
        () => const HomeView(),
        transition: Transition.fadeIn,
        duration: kTranstionDuration,
      );
    });
  }
}
