import 'package:ai_bot/helper/global.dart';
import 'package:ai_bot/main.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomBtn({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              elevation: 0,
              backgroundColor: Theme.of(context).buttonColor,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              minimumSize: Size(mq.width * .4, 50)),
          onPressed: onTap,
          child: Text(text)),
    );
  }
}
