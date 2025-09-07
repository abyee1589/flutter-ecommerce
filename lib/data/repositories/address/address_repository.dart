import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_app/features/personalization/models/addres_model.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  /// Variables
  final db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information, please try again later';
      }
      final result = await db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .get();
      final addresses = result.docs
          .map(
            (documentSnapshot) =>
                AddressModel.fromDocumentSnapshot(documentSnapshot),
          )
          .toList();
      return addresses;
    } catch (e) {
      print(e);
      throw 'Something went wrong while fetching user information, please try again later!';
    }
  }

  Future<void> updateSelectedAddress(String addressId, bool isSelected) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information, please try again later';
      }
      await db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'IsSelected': isSelected});
    } catch (e) {
      throw 'Something went wrong while fetching user information, please try again later!';
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'Unable to find user information, please try again later';
      }
      final currentAddress = await db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong while adding user new address, please try again later!';
    }
  }
}
