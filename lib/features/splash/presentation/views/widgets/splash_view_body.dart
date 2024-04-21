import 'dart:async';

import 'package:bookly_app/core/utils/assets_manager.dart';
import 'package:bookly_app/core/utils/routes_manager.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  // ranges from 0:1
  late AnimationController animationController;
  late Animation<Offset> slidingUpAnimation;
  // Timer? _timer;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    _startDelayOfNavigationToHomeView();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // to make the child take the beggest size of screen
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AppImageAssets.appLogo,
        ),
        const SizedBox(
          height: 4.0,
        ),
        SlidingText(
          slidingUpAnimation: slidingUpAnimation,
        ),
      ],
    );
  }

  _startDelayOfNavigationToHomeView() {
    // _timer =
    Timer(
      const Duration(
        seconds: 3,
      ),
      _goToHomeView,
    );
  }

  _goToHomeView() {
    // Get.off(
    //   () => const HomeView(),
    //   transition: Transition.fade,
    // );

    GoRouter.of(context).pushReplacement(Routes.kHomeView);
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingUpAnimation = Tween<Offset>(
      begin: const Offset(0, 5),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
