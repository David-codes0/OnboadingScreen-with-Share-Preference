import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding_ui/models/onboarding_setting.dart';
import 'package:onboarding_ui/pages/home_page.dart';
import 'package:onboarding_ui/pages/onboarding_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


bool? seenOnBoard;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // show status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);

  // to load onboard shared preferences for the first time
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seenOnBoard = prefs.getBool('seenOnboard') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingSetting(),
      builder: (context,child) =>   Consumer<OnboardingSetting>(
        builder: (context, value, child) => MaterialApp(
          home: value.seenOnboard ? const HomePage() :  const OnboardingPage(),
        ), 
      ), 
    
    );
  }
}
