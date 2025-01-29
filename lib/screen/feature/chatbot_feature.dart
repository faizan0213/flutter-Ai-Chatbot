import 'package:ai_bot/controller/chat_controller.dart';
import 'package:ai_bot/main.dart';
import 'package:ai_bot/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/global.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final _c = ChatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with AI Assistant'), // title
      ),
      // textfeild for messaging
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
                child: TextField(
              controller: _c.textC,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  isDense: true,
                  hintText: 'Ask me anything....',
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)))),
            )),
            SizedBox(), // for space
            // send button for sending the message
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).buttonColor,
              child: IconButton(
                onPressed: _c.askQuestion,
                icon: Icon(
                  Icons.rocket_launch_rounded,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => ListView(
          physics: BouncingScrollPhysics(),
          controller: _c.scrollC,
          padding:
              EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
          children: _c.list
              .map((e) => MessageCard(
                    message: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
