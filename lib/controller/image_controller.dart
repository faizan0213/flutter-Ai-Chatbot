import 'dart:developer';
import 'dart:io';
import 'package:ai_bot/apis/apis.dart';
import 'package:ai_bot/helper/my_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

enum Status { none, loading, complete }

class ImageController extends GetxController {
  final textC = TextEditingController();

  final url = ''.obs;
  final imageList = <String>[].obs;

  final status = Status.none.obs;

  Future<void> createAIImage(dynamic image) async {
    if (textC.text.trim().isNotEmpty) {
      status.value = Status.loading;

      url.value = image.data[0].url.toString();

      textC.text = '';
      status.value = Status.complete;
    } else {
      MyDialog.info('Provide some beautiful image description');
    }
  }

  // function for downloading image
  void downloadImage() async {
    try {
      //To show loading
      MyDialog.showLoadingDialog();

      log('url: $url');

      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      final dir = await getTemporaryDirectory();

      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      log('filePath: ${file.path}');
      //save image to gallery
      await ImageGallerySaverPlus.saveImage(bytes);
      {
        //hide loading
        Get.back();

        MyDialog.success('Image Downloaded to Gallery!');
      }
    } catch (e) {
      //hide loading
      Get.back();
      MyDialog.error('Something Went Wrong (Try again in sometime)!');
      log('downloadImageE: $e');
    }
  }
  // for share the image 
  void shareImage() async {
    try {
      //To show loading
      MyDialog.showLoadingDialog();

      log('url: $url');

      final bytes = (await get(Uri.parse(url.value))).bodyBytes;
      final dir = await getTemporaryDirectory();

      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      log('filePath: ${file.path}');
      {
        //hide loading
        Get.back();
        await Share.shareXFiles([XFile(file.path)],
            text:
                'Check Out this Amazing Image Created in My chatbot by Faizan Mehar');
        MyDialog.success('Image Shared Successfully!');
      }
    } catch (e) {
      //hide loading
      Get.back();
      MyDialog.error('Something Went Wrong (Try again in sometime)!');
      log('downloadImageE: $e');
    }
  }

// function for searching image
  Future<void> searchAiImage() async {
    if (textC.text.trim().isNotEmpty) {
      imageList.value = await APIs.searchAiImages(textC.text);
      if (imageList.isEmpty) {
        MyDialog.error('Something went wrong (Try again in sometime)');
        return;
      }

      url.value = imageList.first;

      status.value = Status.complete;
    } else {
      MyDialog.info(
          'Provide some beautiful image description'); // dialog(notification)
    }
  }
}
