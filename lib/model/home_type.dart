import 'package:ai_bot/screen/feature/chatbot_feature.dart';
import 'package:ai_bot/screen/feature/image_feature.dart';
import 'package:ai_bot/screen/feature/translator_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator } // ai names

extension MyHomeType on HomeType {
  // for tittle (name of ai)
  String get title => switch (this) {
        HomeType.aiChatBot => 'Ai ChatBot',
        HomeType.aiImage => 'Ai Image Creator',
        HomeType.aiTranslator => 'Ai Translator',
      };
  // for lottie (images of ai)
  String get lottie => switch (this) {
        HomeType.aiChatBot => 'Aiwaving.json',
        HomeType.aiImage => 'aiask.json',
        HomeType.aiTranslator => 'aihello.json',
      };
  // for left and right of ai image and title
  bool get leftAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImage => false,
        HomeType.aiTranslator => true,
      };
  // for padding means one image is big and other small (set acc. to you)
  EdgeInsets get padding => switch (this) {
        HomeType.aiChatBot => EdgeInsets.zero,
        HomeType.aiImage => EdgeInsets.all(20),
        HomeType.aiTranslator => EdgeInsets.zero,
      };

  VoidCallback get onTap => switch (this) {
        HomeType.aiChatBot => () => Get.to(() => ChatbotFeature()),
        HomeType.aiImage => () => Get.to(() => ImageFeature()),
        HomeType.aiTranslator => () => Get.to(() => TranslatorFeature()),
      };
}
