import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = '',
    required this.isFeatured,
  });

  /// Convert Category model to JSON structure for storing data in Firestore
  toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  /// Factory constructor to create a CategoryModel from a Firestore document snapshot.
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    // Check if the document data is null
    if (document.data() == null) {
      return CategoryModel(id: '', name: '', image: '', isFeatured: false);
    }

    final data = document.data()!;

    return CategoryModel(
      id: document.id,
      // FIX: Added null-aware operators to handle potential null values from Firestore.
      // If a field is null in the database, it will now default to a safe value.
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      parentId: data['ParentId'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
    );
  }
   @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, image: $image, parentId: $parentId, isFeatured: $isFeatured)';
  }
}
