

import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String id;
  String image;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.id,
    required this.image,
    required this.targetScreen,
    required this.active ,
  });

  Map<String, dynamic> toJson() {
   return {
     'id': id,
     'Image': image,
     'TargetScreen': targetScreen,
     'Active': active,
   };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      id: data['id'] ?? '',
      image: data['Image'] ?? '',
      targetScreen: data['TargetScreen'] ?? '',
      active: data['Active'] ?? false,
    );
  }
}