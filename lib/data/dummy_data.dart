

import 'package:flutter_app/features/shop/models/banner_model.dart';
import 'package:flutter_app/features/shop/models/category_model.dart';
import 'package:flutter_app/routes/routes.dart';
import 'package:flutter_app/utils/constants/image_strings.dart';

class AbDummyData {
  static List<CategoryModel> categories = [
    CategoryModel(id: '1', image: AbImages.productImage2, name: 'Sports', isFeatured: true),
    CategoryModel(id: '2', image: AbImages.shoeIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '3', image: AbImages.clothIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '4', image: AbImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '5', image: AbImages.clothIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '6', image: AbImages.clothIcon, name: 'Jewellery', isFeatured: true),

    ///=========Subcategories======
    ///Sports subcategories
    CategoryModel(id: '7', image: AbImages.shoeIcon, name: 'Sport subcategory', parentId: '1', isFeatured: false),
    CategoryModel(id: '8', image: AbImages.shoeIcon, name: 'Sport subcategory', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: AbImages.clothIcon, name: 'Sport subcategory', parentId: '1', isFeatured: false),

    /// Furniture subcategories
    CategoryModel(id: '10', image: AbImages.clothIcon, name: 'Furniture subcategory', parentId: '2', isFeatured: false),
    CategoryModel(id: '11', image: AbImages.shoeIcon, name: 'Furniture subcategory', parentId: '2', isFeatured: false),
    CategoryModel(id: '12', image: AbImages.clothIcon, name: 'Furniture subcategory', parentId: '2', isFeatured: false),

    /// Electronics subcategories
    CategoryModel(id: '13', image: AbImages.clothIcon, name: 'Electronics subcategories', parentId: '3', isFeatured: false),
    CategoryModel(id: '14', image: AbImages.shoeIcon, name: 'Electronics subcategories', parentId: '3', isFeatured: false),
    CategoryModel(id: '15', image: AbImages.clothIcon, name: 'Electronics subcategories', parentId: '3', isFeatured: false),
    
    /// Clothes subcategories
    CategoryModel(id: '16', image: AbImages.clothIcon, name: 'Clothes subcategories', parentId: '4', isFeatured: false),
    CategoryModel(id: '17', image: AbImages.shoeIcon, name: 'Clothes subcategories', parentId: '4', isFeatured: false),
    CategoryModel(id: '18', image: AbImages.clothIcon, name: 'Clothes subcategories', parentId: '4', isFeatured: false),
    
    /// Shoes subcategories
    CategoryModel(id: '19', image: AbImages.clothIcon, name: 'Shoes subcategories', parentId: '5', isFeatured: false),
    CategoryModel(id: '20', image: AbImages.shoeIcon, name: 'Shoes subcategories', parentId: '5', isFeatured: true),
    CategoryModel(id: '21', image: AbImages.clothIcon, name: 'Shoes subcategories', parentId: '5', isFeatured: false),

    /// Jewlerry subcategories
    CategoryModel(id: '22', image: AbImages.clothIcon, name: 'Jewellery subcategories', parentId: '6', isFeatured: false),
    CategoryModel(id: '23', image: AbImages.shoeIcon, name: 'Jewellery subcategories', parentId: '6', isFeatured: false),
    CategoryModel(id: '24', image: AbImages.clothIcon, name: 'Jewellery subcategories', parentId: '6', isFeatured: false),
  ];

  static List<BannerModel> banners = [
    BannerModel(image: AbImages.promoBanner1, targetScreen: AbRoutes.cart, active: true),
    BannerModel(image: AbImages.promoBanner1, targetScreen: AbRoutes.cart, active: true),
    BannerModel(image: AbImages.clothIcon, targetScreen: AbRoutes.favourites, active: true),
    BannerModel(image: AbImages.clothIcon, targetScreen: AbRoutes.favourites, active: true),
    BannerModel(image: AbImages.clothIcon, targetScreen: AbRoutes.order, active: true),
    BannerModel(image: AbImages.clothIcon, targetScreen: AbRoutes.order, active: true),
  ];
}