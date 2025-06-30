import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen', style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AbSizes.defaultSpace),
          child: Column(
            children: [
              Text('Welcome to home screen', style: Theme.of(context).textTheme.headlineSmall)
            ],
          ),
        )
      ),
    );
  }
}