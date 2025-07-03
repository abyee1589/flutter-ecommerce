import 'package:flutter/material.dart';
import 'package:flutter_app/features/shop/controllers/home_controller/home_controller.dart';
import 'package:get/get.dart';
import 'app.dart';

void main(){
   Get.put(HomeController());
   runApp(const App());
}
