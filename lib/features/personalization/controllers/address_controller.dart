import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_app/data/repositories/address/address_repository.dart';
import 'package:flutter_app/features/personalization/models/addres_model.dart';
import 'package:flutter_app/features/personalization/screens/address/add_new_address.dart';
import 'package:flutter_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';
import 'package:flutter_app/utils/constants/sizes.dart';
import 'package:flutter_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter_app/utils/helpers/network_manager.dart';
import 'package:flutter_app/utils/loaders/circular_loader.dart';
import 'package:flutter_app/utils/loaders/full_screen_loader.dart';
import 'package:flutter_app/utils/loaders/loaders.dart';
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
      final addresses = await addresRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
        (address) => address.isSelected,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
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
      // Show loader dialog
      Get.defaultDialog(
        title: '',
        onWillPop: () async => false,
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const AbCircularLoader(),
      );

      // Unselect previous address
      if (selectedAddress.value.id.isNotEmpty) {
        await addresRepository.updateSelectedAddress(
          selectedAddress.value.id,
          false,
        );
      }

      // Update current selection
      newSelectedAddress.isSelected = true;
      selectedAddress.value = newSelectedAddress;

      await addresRepository.updateSelectedAddress(
        selectedAddress.value.id,
        true,
      );

      // Refresh addresses (optional)
      await getAllUserAddresses();

      // ✅ Close the loader dialog
      Get.back();
    } catch (e) {
      // ✅ Also close the dialog if error occurs
      Get.back();
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

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
       builder: (_) => Container(
        padding: const EdgeInsets.all(AbSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AbSectionHeading(title: 'Select Address'),
            FutureBuilder(
              future: getAllUserAddresses(), 
              builder: (_, snapshot) {
                final response = AbCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot);
                if(response != null) return response;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => AbSingleAddress(
                    address: snapshot.data![index], 
                    onTap: () async {
                      await selectAddress(snapshot.data![index]);
                      Get.back();
                    }
                  )
                );
              }
            ),
            const SizedBox(height: AbSizes.defaultSpace),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.to(() => const AddNewAddressScreen()), child: const Text('Select New Address')),
            )
          ],
        ),
       )
    );
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
