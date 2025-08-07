import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_app/data/repositories/category/category_repository.dart';
import 'package:flutter_app/data/repositories/user/user_repository.dart';
import 'package:flutter_app/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_app/features/shop/controllers/home_controller/category_controller.dart';
import 'package:flutter_app/features/shop/controllers/home_controller/home_controller.dart';
import 'package:flutter_app/navigation_menu.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async{
  /// Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  
  /// GetX Local Storage
  await GetStorage.init();

  /// await splash untill other items load
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize Firebase and Authentication History
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
    .then((FirebaseApp value){
      Get.put(AuthenticationRepository());
      Get.put(LoginController());
      Get.put(HomeController());
      Get.put(NavigationController());
      Get.put(SignupController());
      Get.put(UserRepository());   // ✅ REGISTER IT FIRST
      Get.put(UserController()); 
      Get.put(CategoryRepository()); 
      Get.put(CategoryController()); 
    });

  runApp(const App());
}
