import 'package:ai_bot/helper/global.dart';
import 'package:ai_bot/helper/pref.dart';
import 'package:ai_bot/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

// for iniatilizing hive to use app directory
  await Pref.initialize();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,

      themeMode: Pref.defaultTheme,

      darkTheme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          elevation: 1,
          centerTitle: true,
          backgroundColor: Theme.of(context).lightTextColor,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      // for theme bar of app (dark/light)
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue), // back button
          titleTextStyle: TextStyle(
              color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
// create apptheme for app themebar
extension AppTheme on ThemeData {
  Color get lightTextColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;

  Color get buttonColor =>
      brightness == Brightness.dark ? Colors.cyan.withOpacity(.5) : Colors.blue;
}
