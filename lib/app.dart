import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/screens/onboarding.dart';
import 'package:flutter_app/utils/theme/theme.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatelessWidget {
    const App({super.key});

    @override 
    Widget build(BuildContext context) {
      return GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: AbAppTheme.lightTheme,
        darkTheme: AbAppTheme.darkTheme,
        home: OnBoardingScreen(),
      );
    }
}