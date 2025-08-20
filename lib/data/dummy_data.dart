

import 'package:flutter_app/features/shop/models/banner_model.dart';
import 'package:flutter_app/features/shop/models/brand_model.dart';
import 'package:flutter_app/features/shop/models/category_model.dart';
import 'package:flutter_app/features/shop/models/product_attributes_model.dart';
import 'package:flutter_app/features/shop/models/product_model.dart';
import 'package:flutter_app/features/shop/models/product_variation_model.dart';
import 'package:flutter_app/routes/routes.dart';
import 'package:flutter_app/utils/constants/enums.dart';
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

  static final List<ProductModel> products = [
    ProductModel(
      id: '001', 
      title: 'Nike sport shoes', 
      stock: 15, 
      price: 135, 
      isFeatured: true,
      thumbnail: AbImages.productImage2,
      description: 'It is the best shoes you will enjoy', 
      brand: BrandModel(id: '1', image: AbImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [AbImages.productImage1, AbImages.productImage1, AbImages.shoeIcon],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productType: ProductType.variable.toString(),
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: AbImages.productImage1,
          description: 'This is product description for gold nike sport shoes',
          attributeValues: {'Color': 'Gold', 'Size': 'EU 34'}
        ),
        ProductVariationModel(
          id: '2',
          stock: 32,
          price: 130,
          salePrice: 120.6,
          image: AbImages.productImage2,
          description: 'This is product description for brown nike sport shoes',
          attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}
        ),
        ProductVariationModel(
          id: '1',
          stock: 30,
          price: 135,
          salePrice: 112.6,
          image: AbImages.shoeIcon,
          description: 'This is product description for red nike sport shoes',
          attributeValues: {'Color': 'Red', 'Size': 'EU 30'}
        )
      ],
    ),
    // ProductModel(
    //   id: '002', 
    //   title: 'Gold nike sport shoes', 
    //   stock: 15, 
    //   price: 135, 
    //   isFeatured: true,
    //   thubnail: AbImages.promoBanner1,
    //   description: 'It is the best shoes you will enjoy', 
    //   brand: BrandModel(id: '1', image: AbImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
    //   images: [AbImages.productImage1, AbImages.productImage1, AbImages.shoeIcon],
    //   salePrice: 30,
    //   sku: 'ABR4568',
    //   categoryId: '1',
    //   productType: ProductType.variable.toString(),
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
    //     ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 34,
    //       price: 134,
    //       salePrice: 122.6,
    //       image: AbImages.productImage1,
    //       description: 'This is product description for gold nike sport shoes',
    //       attributeValues: {'Color': 'Gold', 'Size': 'EU 34'}
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 32,
    //       price: 130,
    //       salePrice: 120.6,
    //       image: AbImages.productImage2,
    //       description: 'This is product description for brown nike sport shoes',
    //       attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}
    //     ),
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 30,
    //       price: 135,
    //       salePrice: 112.6,
    //       image: AbImages.shoeIcon,
    //       description: 'This is product description for red nike sport shoes',
    //       attributeValues: {'Color': 'Red', 'Size': 'EU 30'}
    //     )
    //   ],
    // ),
    // ProductModel(
    //   id: '003', 
    //   title: 'Gold nike sport shoes', 
    //   stock: 15, 
    //   price: 135, 
    //   isFeatured: true,
    //   thubnail: AbImages.clothIcon,
    //   description: 'It is the best shoes you will enjoy', 
    //   brand: BrandModel(id: '1', image: AbImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
    //   images: [AbImages.productImage1, AbImages.productImage1, AbImages.shoeIcon],
    //   salePrice: 30,
    //   sku: 'ABR4568',
    //   categoryId: '1',
    //   productType: ProductType.variable.toString(),
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
    //     ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 34,
    //       price: 134,
    //       salePrice: 122.6,
    //       image: AbImages.productImage1,
    //       description: 'This is product description for gold nike sport shoes',
    //       attributeValues: {'Color': 'Gold', 'Size': 'EU 34'}
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 32,
    //       price: 130,
    //       salePrice: 120.6,
    //       image: AbImages.productImage2,
    //       description: 'This is product description for brown nike sport shoes',
    //       attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}
    //     ),
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 30,
    //       price: 135,
    //       salePrice: 112.6,
    //       image: AbImages.shoeIcon,
    //       description: 'This is product description for red nike sport shoes',
    //       attributeValues: {'Color': 'Red', 'Size': 'EU 30'}
    //     )
    //   ],
    // )
  ];
}