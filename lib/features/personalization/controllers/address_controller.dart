import 'package:flutter/widgets.dart';
import 'package:flutter_app/data/repositories/address/address_repository.dart';
import 'package:flutter_app/features/personalization/models/addres_model.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/helpers/network_manager.dart';
import 'package:flutter_app/utils/popups/full_screen_loader.dart';
import 'package:flutter_app/utils/popups/loaders.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  /// Variables
  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addresRepository = Get.put(AddressRepository());

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final address = await addresRepository.fetchUserAddress();
      selectedAddress.value = address.firstWhere(
        (address) => address.isSelected,
        orElse: () => AddressModel.empty(),
      );
      return address;
    } catch (e) {
      AbLoaders.errorSnackBar(
        title: 'Address Not Found!',
        message: e.toString(),
      );
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      if (selectedAddress.value.id.isNotEmpty) {
        await addresRepository.updateSelectedAddress(
          selectedAddress.value.id,
          false,
        );
      }
      newSelectedAddress.isSelected = true;
      selectedAddress.value = newSelectedAddress;

      await addresRepository.updateSelectedAddress(
        selectedAddress.value.id,
        true,
      );
    } catch (e) {
      AbLoaders.errorSnackBar(
        title: 'Error while selecting address!',
        message: e.toString(),
      );
      return [];
    }
  }

  Future addNewAddress(AddressModel newSelectedAddress) async {
    try {
      AbFullScreenLoader.openLoadingDialog(
        'Storing Address',
        AbImages.lottieAnimation,
      );
      final isConncted = await NetworkManager.instance.isConnected();
      if (!isConncted) {
        AbFullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
      );

      final id = await addresRepository.addAddress(address);

      address.id = id;
      await selectAddress(address);
      AbFullScreenLoader.stopLoading();
      AbLoaders.successSnackBar(
        title: 'Congratualations!',
        message: 'Your address is saved successfully!',
      );
      refreshData.toggle();
      refreshFormFields();
      Navigator.of(Get.context!).pop();
    } catch (e) {
      AbLoaders.errorSnackBar(
        title: 'Error while selecting address!',
        message: e.toString(),
      );
      return [];
    }
  }

  void refreshFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    city.clear();
    state.clear();
    postalCode.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
