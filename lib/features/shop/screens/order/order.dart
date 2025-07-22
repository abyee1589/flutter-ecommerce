import 'package:flutter/material.dart';
import 'package:flutter_app/common/widgets/appbar/appbar.dart';
import 'package:flutter_app/features/shop/screens/order/widgets/order_list.dart';
import 'package:flutter_app/utils/constants/sizes.dart';

class Orderscreen extends StatelessWidget {
  const Orderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AbAppBar(title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(AbSizes.defaultSpace),

        /// Orders
        child: AbOrderListItems(),
      ),
    );
  }
}