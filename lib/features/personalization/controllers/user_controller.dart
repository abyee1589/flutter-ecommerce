

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/data/repositories/user/user_repository.dart';
import 'package:flutter_app/features/authentication/models/user_model.dart';
import 'package:flutter_app/utils/local_storage/cloudinar.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = UserRepository.instance;
  Rx<UserModel> user = UserModel.empty().obs;

  Future<void> saveUserRcord(UserCredential? userCredential) async{
    try {
      // final user = await fetchUserRecord();
      // if(user.value.id.isEmpty) {
        if(userCredential != null) {
          /// Convert user credential to first name and last name
          final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredential.user!.displayName ?? '');


          /// Map Data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          /// Save User Data
          await userRepository.saveUserRecord(user);
        }
      // }
      
    }catch(e) {
      AbLoaders.warningSnackBar(
        title: 'Data Not saved!',
        message: 'something went wrong while saving your information. You can re-save your data in your profile.');

    }
  }

  Future<void> uploadProfilePicture() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (pickedImage != null) {
      final filePath = pickedImage.path;

      // 1. Upload to Cloudinary
      final imageUrl = await uploadImage(filePath); // This returns the URL of the uploaded image

      if (imageUrl != null) {
        // 2. Save to Firestore
        await userRepository.saveUserProfileImageUrl(imageUrl);
        print('✅ Profile image uploaded and saved successfully!');
      } else {
        print('❌ Failed to upload image to Cloudinary');
      }
    } else {
      print('⚠️ No image selected');
    }
  }
}