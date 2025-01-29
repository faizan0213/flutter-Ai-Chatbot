import 'package:ai_bot/apis/apis.dart';
import 'package:ai_bot/helper/my_dialog.dart';
import 'package:ai_bot/model/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final textC = TextEditingController();

  final scrollC = ScrollController();
  final list = <Message>[
    Message(
        msg: 'Hello Faizan, How can I help you Today?',
        msgType: MessageType.bot)
  ].obs;

  Future<void> askQuestion() async {
    if (textC.text.trim().isNotEmpty) {
      list.add(Message(msg: textC.text, msgType: MessageType.user));
      list.add(Message(msg: '', msgType: MessageType.bot));
      _scrollDown();

      final res = await APIs.getAnswer(textC.text);

      // message from bot
      list.removeLast();
      list.add(Message(msg: res, msgType: MessageType.bot));
      _scrollDown();

      textC.text = '';
    } else {
      MyDialog.info('Ask Something!');
    }
  }

// for moving to end message and bottom
  void _scrollDown() {
    scrollC.animateTo(scrollC.position.maxScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
}
