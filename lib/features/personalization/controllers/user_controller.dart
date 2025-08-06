

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_app/data/repositories/user/user_repository.dart';
import 'package:flutter_app/features/authentication/models/user_model.dart';
import 'package:flutter_app/features/authentication/screens/login/login.dart';
import 'package:flutter_app/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/http/network_manager.dart';
import 'package:flutter_app/utils/local_storage/cloudinar.dart';
import 'package:flutter_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final hidePassword = false.obs;
  final imageUploading = false.obs;

  Rx<UserModel> user = UserModel.empty().obs;

  
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = UserRepository.instance;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();



  @override
  void onInit(){
    super.onInit();
    fetchUserRecord();
  }
  Future<void> saveUserRecord(UserCredential? userCredential) async{
    try {
      if(user.value.id.isEmpty) {
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
      }
      
    }catch(e) {
      AbLoaders.warningSnackBar(
        title: 'Data Not saved!',
        message: 'something went wrong while saving your information. You can re-save your data in your profile.');

    }
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async{
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
        /// Save user data 
        await userRepository.saveUserRecord(user);
      } catch(e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

/// Upload user profile picture
  Future<void> uploadProfilePicture() async {
  try {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (pickedImage == null) return;

    imageUploading.value = true;
    // AbFullScreenLoader.openLoadingDialog('Uploading...', AbImages.lottieAnimation); // Show loader

    final cloudinaryUploader = CloudinaryUpload();
    final imageUrl = await cloudinaryUploader.uploadFile(pickedImage).timeout(const Duration(seconds: 60));

    // Get.back(); // Remove loader

    if (imageUrl == null || imageUrl.isEmpty) {
      AbLoaders.errorSnackBar(title: 'Upload Failed', message: 'Please try again.');
      return;
    }

    // Save URL to Firestore or backend
    await userRepository.saveUserProfileImageUrl(imageUrl);

    // Update local user object
    user.update((val) {
      if (val != null) val.profilePicture = imageUrl;
    });

    AbLoaders.successSnackBar(title: 'Congratualtions!', message: 'Profile picture updated successfully!');
  } catch (e) {
    if (Get.isDialogOpen ?? false) Get.back(); // Close loader if error
    AbLoaders.errorSnackBar(title: 'Error', message: e.toString());
  } finally {
    imageUploading.value = false;
  }
}

/// Delete account warning popup
void deleteAccountWarningPopup() {
  Get.defaultDialog(
    contentPadding: const EdgeInsets.all(AbSizes.md),
    title: 'Delete Account',
    middleText: 'Are you sure you want to delete your account permanently?',
    confirm: ElevatedButton(
      onPressed: () => deleteUserAccount(),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)), 
      child: const Padding(padding: EdgeInsets.symmetric(horizontal: AbSizes.lg), child: Text('Delete'))
    ),
    cancel: OutlinedButton(
      onPressed: () => Navigator.of( Get.overlayContext!).pop(), child: const Text('Cancel'))
  );
}

/// Delete user account
void deleteUserAccount() async {
  try{
    AbFullScreenLoader.openLoadingDialog('Processing', AbImages.lottieAnimation);
    final auth = AuthenticationRepository.instance;
    final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
    if(provider.isNotEmpty){
      if(provider == 'google.com'){
        await auth.signInWithGoogle();
        await auth.deleteAccount();
        AbFullScreenLoader.stopLoading();
        Get.offAll(() => const LoginScreen());
      }
      else if(provider == 'password'){
        AbFullScreenLoader.stopLoading();
        Get.to(() => const ReAuthLoginForm());
      }
    }
  }catch(e) {
    AbFullScreenLoader.stopLoading();
    AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }
}

/// Re-authenticate the user to delete his/her account
 Future<void> reAuthenticateEmailAndPasswordUser() async{
  try {
    AbFullScreenLoader.openLoadingDialog('Processing', AbImages.lottieAnimation);
    final isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected) {
      AbFullScreenLoader.stopLoading();
      return;
    }
    if(!reAuthFormKey.currentState!.validate()){
      AbFullScreenLoader.stopLoading();
      return;
    }
    await AuthenticationRepository.instance.reAuthenticateEmailAndPasswordUser(verifyEmail.text.trim(), verifyPassword.text.trim());
    await AuthenticationRepository.instance.deleteAccount();
    AbFullScreenLoader.stopLoading();
    Get.offAll(() => const LoginScreen());
  } catch(e) {
    AbFullScreenLoader.stopLoading();
    AbLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }
 }

}