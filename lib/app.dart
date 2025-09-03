import 'package:flutter/material.dart';
import 'package:flutter_app/bindings/general_binding.dart';
import 'package:flutter_app/navigation_menu.dart';
import 'package:flutter_app/routes/app_routes.dart';
import 'package:flutter_app/utils/device/scroll_behavior.dart';
import 'package:flutter_app/utils/theme/theme.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: MyScrollBehavior(),
      themeMode: ThemeMode.system,
      theme: AbAppTheme.lightTheme,
      darkTheme: AbAppTheme.darkTheme,
      home: const NavigationMenu(),
      initialBinding: GeneralBinding(),
      getPages: AppRoutes.pages,
    );
  }
}
