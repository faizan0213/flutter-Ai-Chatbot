import 'package:ai_bot/helper/global.dart';
import 'package:ai_bot/model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HomeCard extends StatelessWidget {
  // declare the hometype class
  final HomeType homeType;
  const HomeCard({
    super.key,
    required this.homeType,
    // ignore: non_constant_identifier_names
    required HomeType HomeType,
  });

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return Card(
      color: Colors.blue.withOpacity(.2),
      elevation: 0,
      margin: EdgeInsets.only(bottom: mq.height * .02),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        onTap: homeType.onTap,
        child: homeType.leftAlign
            ? Row(
                children: [
                  Container(
                    width: mq.width * .35,
                    padding: homeType.padding,
                    // we use the hometype class for uploading lotties
                    child: Lottie.asset('assets/lottie/${homeType.lottie}'),
                  ),
                  Spacer(), // for space
                  Text(
                    homeType.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(flex: 2),
                ],
              )
            : Row(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    homeType.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Container(
                    width: mq.width * .35,
                    padding: homeType.padding,
                    child: Lottie.asset('assets/lottie/${homeType.lottie}'),
                  ),
                ],
              ),
      ),
    )
        .animate()
        .fade(duration: NumDurationExtensions(1).seconds, curve: Curves.easeIn);
  }
}
