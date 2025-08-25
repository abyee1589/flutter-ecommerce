import 'package:flutter_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter_app/utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(UserController());
  }
}
