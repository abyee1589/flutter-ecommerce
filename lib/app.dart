import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/screens/onboarding.dart';
import 'package:flutter_app/utils/theme/theme.dart';

class App extends StatelessWidget {
    const App({super.key});

    @override 
    Widget build(BuildContext context) {
      return MaterialApp(
        themeMode: ThemeMode.system,
        theme: AbAppTheme.lightTheme,
        darkTheme: AbAppTheme.darkTheme,
        home: const OnBoardingScreen(),
      );
    }
}