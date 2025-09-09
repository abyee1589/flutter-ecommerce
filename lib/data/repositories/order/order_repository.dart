
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_app/features/shop/models/order_model.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController{
  static OrderRepository get instance => Get.find();

  /// Variables 
  final db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) throw 'Unable to find user information with this id, please try again!' ;
      final result = await db.collection('Users').doc(userId).collection('Orders').get();
      final userOrders = result.docs.map((order) => OrderModel.fromSnapshot(order)).toList();
      return userOrders;
    }catch(e){
      throw 'Something went wrong while fetching your orders, please try again!';
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async{
    try{
      await db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
    }catch(e){
      throw 'Something went wrong while creating your order, please try again!';
    }
  }
}