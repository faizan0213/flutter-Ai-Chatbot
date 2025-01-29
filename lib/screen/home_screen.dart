import 'package:ai_bot/helper/global.dart';
import 'package:ai_bot/helper/pref.dart';
import 'package:ai_bot/model/home_type.dart';
import 'package:ai_bot/widget/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _isDarkMode = Pref.isDarkMode.obs;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        actions: [
          IconButton(
              padding: EdgeInsets.all(20),
              onPressed: () {
                Get.changeThemeMode(
                    _isDarkMode.value ? ThemeMode.light : ThemeMode.dark);

                _isDarkMode.value = !_isDarkMode.value;
                Pref.isDarkMode = _isDarkMode.value;
              },
              icon: Obx(
                () => Icon(
                  _isDarkMode.value
                      ? Icons.brightness_3_rounded
                      : Icons.brightness_4_rounded,
                  size: 26,
                ),
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
        children: HomeType.values
            .map((e) => HomeCard(homeType: e, HomeType: e))
            .toList(),
      ),
    );
  }
}
