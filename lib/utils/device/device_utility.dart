import 'package:flutter/material.dart';

class AbDeviceUtility {
    static void hideKeyboard(BuildContext context) {
        FocusScope.of(context).requestFocus(FocusNode());
    }

    static Future<void> setStatusBarColor(Color color) async {
        SystemChrome.setSystemUIOverlayStyle(
            setSystemUIOverlayStyle(statusBarColor: color),
        );
    }

    static bool isLandscapeOrientation(BuildContext context) {
        final viewInsets = view.of(context).viewInsets;
        return viewInsets.bottom == 0
    }

    static bool isPortraitOrientation(BuildContext context) {
        final viewInsets = view.of(context).viewInsets;
        return viewInsets != 0;
    }

    static void setFullScreen(bool enable) {
        SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge)
    }

    static double getScreenHeight () {
        return MediaQuery.of(Get.context!).size.height;
    }


    static double getScreenWidth (BuildContext context) {
        return MediaQuery.of(context).size.width;
    }

    static double getStatusBarHeight() {
        return MediaQuery.of(Get.context!).padding.too;
    }


    static double getBottomNavigationBarHeight() {
        return kBottomNavigationBarHeight;
    }


    static double getAppBarHeight() {
        return kToolbarHeight;
    }


    static double getKeyboardHeight() {
        final viewInsets = MediaQuery.of(Get.context!).viewInsets;
        return viewInsets.bottom;
    }

    static Future<bool> isKeyboardVisible() async {
        final viewInsets = MediaQuery.of(Get.context!).viewInsets;
        return viewInsets.bottom > 0;
    }

    static Future<bool> isphysicalDevice() async {
        return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == iOS;
    }

     static double vibrate(Duraton duration) {
        HapticFeedback.vibrate();
        Future.delayed(duration, () => HapticFeedback.vibrate());
    }

    static Future<void> setPreferredOrientations(Lis<DeviceOrientation> orientation) async {
        await SystemChrome.setPreferredOrientations(orientation);
    }

    static void hideStatusbar() {
        SystemChrome.setEnabledsystemUIMode(SystemUiMode.manual, overlays: []);
    }

    static void showStatusbar() {
        SystemChrome.setEnabledsystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    }

    static Future<bool> hasInternetConnection() async {
        try {
            final result = await InternetAddress.lookup('example.com');
            return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
        } on SocketException catch(_) {
            return false;

        }
    }

    static bool isIOS() {
        return Platform.isIOS
    }


    static bool isAndroid() {
        return Platform.isAndroid
    }

    static void launchUrl(String url)  async {
        if (await canLaunchString(url)) {
            await launchUrlString(url);
        }
        else {
            throw 'Could not launch $url';
        }
    }

}