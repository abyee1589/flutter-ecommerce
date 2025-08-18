

import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String? id;
  String image;
  final String targetScreen;
  final bool active;

  BannerModel({
    this.id,
    required this.image,
    required this.targetScreen,
    required this.active ,
  });

  Map<String, dynamic> toJson() {
   return {
     'ImageUrl': image,
     'TargetScreen': targetScreen,
     'Active': active,
   };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      id: snapshot.id,
      image: data['ImageUrl'] ?? '',
      targetScreen: data['TargetScreen'] ?? '',
      active: data['Active'] ?? false,
    );
  }
}