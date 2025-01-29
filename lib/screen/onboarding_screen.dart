import 'package:ai_bot/main.dart';
import 'package:ai_bot/model/onboard.dart';
import 'package:ai_bot/screen/home_screen.dart';
import 'package:ai_bot/widget/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      OnBoard(
        title: 'Ask me Anything',
        subtitle: 'How I can assist you today,Ask me Everything',
        lottie: 'aiask',
      ),
      OnBoard(
        title: 'Imagination to Reality',
        subtitle:
            'Just Imagine nothing & let me know, I will create something wonderful for you',
        lottie: 'aihello',
      ),
    ];
    return Scaffold(
      body: PageView.builder(
          controller: c,
          itemCount: list.length,
          itemBuilder: (ctx, ind) {
            final isLast = ind == list.length - 1;

            return Column(
              // for lottie image of 'ai bot'
              children: [
                Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                    height: mq.height * .6),
                Text(
                  list[ind].title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      letterSpacing: .6),
                ),

                SizedBox(height: mq.height * .015), // for adding some space
                // subtitle
                SizedBox(
                  width: mq.width * .7,
                  child: Text(list[ind].subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          letterSpacing: .6,
                          color: Theme.of(context).lightTextColor)),
                ),
                Wrap(
                  spacing: 10,
                  children: List.generate(
                      2,
                      (i) => Container(
                          width: i == ind ? 15 : 10,
                          height: 8,
                          decoration: BoxDecoration(
                              color: i == ind ? Colors.blue : Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))),
                ),
                Spacer(),
                // button
                CustomBtn(
                    onTap: () {
                      if (isLast) {
                        Get.off(() => HomeScreen());
                      } else {
                        c.nextPage(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.ease);
                      }
                    },
                    text: isLast ? 'Finish' : 'Next'),
                Spacer(flex: 2), // for space
              ],
            );
          }),
    );
  }
}
