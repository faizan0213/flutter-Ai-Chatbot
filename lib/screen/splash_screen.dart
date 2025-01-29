import 'package:ai_bot/helper/global.dart';
import 'package:ai_bot/helper/pref.dart';
import 'package:ai_bot/screen/home_screen.dart';
import 'package:ai_bot/screen/onboarding_screen.dart';
import 'package:ai_bot/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadPreferencesAndNavigate();
  }

  Future<void> _loadPreferencesAndNavigate() async {
    // Ensure preferences are initialized
    await Future.delayed(const Duration(seconds: 3), () {
      // Splash delay

      Get.off(() => Pref.showOnboarding ? OnboardingScreen() : HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context); // Adjust screen according to user's device
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
          //   const Spacer(),
          //   // Card(
          //   //   shape: const RoundedRectangleBorder(
          //   //       borderRadius: BorderRadius.all(Radius.circular(20))),
          //   //   child: Padding(
          //   //     padding: EdgeInsets.all(mq.width * .05),
          //   //     child: Image.asset(
          //   //       'assets/icons/chatbot.png',
          //   //       width: mq.width * .45,
          //   //       height: mq.height * .2,
          //   //     ),
          //     ),
          //   ),
          Spacer(),
             const CustomLoading(), // Lottie animation for loading
             Spacer(),
            // const Spacer(), // for space
          ],
        ),
      ),
    );
  }
}
