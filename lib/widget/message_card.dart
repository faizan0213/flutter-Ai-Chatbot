import 'package:ai_bot/helper/global.dart';
import 'package:ai_bot/main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../model/message.dart';

class MessageCard extends StatelessWidget {
  // initialize the model class
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);
    return message.msgType == MessageType.bot
        // bot
        ? Row(
            children: [
              CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/icons/chatbot.png',
                    width: 24,
                  )),
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * .6),
                margin: EdgeInsets.only(
                    bottom: mq.height * .02, left: mq.width * .02),
                padding: EdgeInsets.symmetric(
                    vertical: mq.height * .01, horizontal: mq.width * .02),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).lightTextColor),
                    borderRadius: BorderRadius.only(
                      topLeft: r,
                      topRight: r,
                      bottomRight: r,
                    )),
                child: message.msg.isEmpty
                    ? AnimatedTextKit(animatedTexts: [
                        TypewriterAnimatedText(
                          '....',
                          textStyle: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 200),
                        ),
                      ], repeatForever: true)
                    : Text(message.msg, textAlign: TextAlign.center),
              )
            ],
          )
        // user
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: mq.width * .6),
                margin: EdgeInsets.only(
                    bottom: mq.height * .02, right: mq.width * .02),
                padding: EdgeInsets.symmetric(
                    vertical: mq.height * .01, horizontal: mq.width * .02),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).lightTextColor),
                    borderRadius: BorderRadius.only(
                      topLeft: r,
                      topRight: r,
                      bottomLeft: r,
                    )),
                child: Text(message.msg, textAlign: TextAlign.center),
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
              SizedBox(width: 6),
            ],
          );
  }
}
