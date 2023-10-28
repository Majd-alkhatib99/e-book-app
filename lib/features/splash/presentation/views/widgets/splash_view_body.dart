import 'package:book_app/core/util/assets_data.dart';
import 'package:book_app/core/util/color_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsData.wLogoImage),
        
        const Text(
          'Read free books',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorData.kPrimeColor
          ),
        )
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).pushReplacement(
          '/HomeView',
        );


      },
    );
  }
}
