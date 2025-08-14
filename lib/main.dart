import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async{
  /// Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();
  
  /// GetX Local Storage
  await GetStorage.init();

  /// await splash untill other items load
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize Firebase and Authentication History
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  .then((FirebaseApp value) {
    Get.put(AuthenticationRepository());
  });
  //  setUrlStrategy(const PathUrlStrategy());
  runApp(const App());
}
