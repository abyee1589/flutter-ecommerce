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
    required this.isFeatured,
    this.parentId = '',
  });
  
   /// Empty Category Model
  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', isFeatured: false);

  /// Convert Model to Json structure so that we can store the data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if(data!= null){
      
      /// Map Json Record to the Model
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    }
    else {
      return CategoryModel.empty();

    }
  }
  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, image: $image, parentId: $parentId, isFeatured: $isFeatured)';
  }
}