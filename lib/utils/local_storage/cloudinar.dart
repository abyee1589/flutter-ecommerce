import 'package:cloudinary_sdk/cloudinary_sdk.dart';

// Initialize Cloudinary with your credentials
final cloudinary = Cloudinary.full(
  apiKey: '336432339352663',
  apiSecret: 'jHeqvuohX-pmv-vTLL1mb0e91NY',
  cloudName: 'dxkvofpde',
);

Future<String?> uploadImage(String filePath) async {
  final response = await cloudinary.uploadResource(
    CloudinaryUploadResource(
      filePath: filePath,
      resourceType: CloudinaryResourceType.image,
      folder: 'user_profiles',
      fileName: 'profile_pic',
    ),
  );

  if (response.isSuccessful) {
    return response.secureUrl; // Return the URL
  } else {
    print('Upload failed: ${response.error}');
    return null;
  }
}
