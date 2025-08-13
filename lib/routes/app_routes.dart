import 'package:flutter_app/features/authentication/screens/login/login.dart';
import 'package:flutter_app/features/authentication/screens/onboarding.dart';
import 'package:flutter_app/features/authentication/screens/paswword_configuration/forget_password.dart';
import 'package:flutter_app/features/authentication/screens/signup/signup.dart';
import 'package:flutter_app/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_app/features/personalization/screens/address/address.dart';
import 'package:flutter_app/features/personalization/screens/profile/profile.dart';
import 'package:flutter_app/features/personalization/screens/settings/setting.dart';
import 'package:flutter_app/features/shop/screens/cart/cart.dart';
import 'package:flutter_app/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_app/features/shop/screens/home/home.dart';
import 'package:flutter_app/features/shop/screens/order/order.dart';
import 'package:flutter_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:flutter_app/features/shop/screens/store/store.dart';
import 'package:flutter_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:flutter_app/routes/routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: AbRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AbRoutes.store, page: () => const StoreScreen()),
    GetPage(name: AbRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: AbRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: AbRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: AbRoutes.order, page: () => const Orderscreen()),
    GetPage(name: AbRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: AbRoutes.cart, page: () => const CartScreen()),
    GetPage(name: AbRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: AbRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: AbRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: AbRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: AbRoutes.signin, page: () => const LoginScreen()),
    GetPage(name: AbRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: AbRoutes.onBoarding, page: () => OnBoardingScreen()),
  ];
}