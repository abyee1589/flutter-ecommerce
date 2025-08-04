import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_app/data/repositories/user/user_repository.dart';
import 'package:flutter_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:flutter_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_app/features/shop/controllers/home_controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async{
  Get.put(HomeController());
  Get.put(SignupController());
  Get.put(UserRepository());
  Get.put(UserController());
  /// Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  
  /// GetX Local Storage
  await GetStorage.init();

  /// await splash untill other items load
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize Firebase and Authentication History
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
    .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const App());
}
