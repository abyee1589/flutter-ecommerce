import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:image_picker/image_picker.dart';

class CloudinaryUpload {
  static const String cloudName = 'dxkvofpde';
  static const String uploadPreset = 'flutter_unsigned';

  Future<String?> uploadFile(XFile file) async {
    try {
      final mimeTypeData = lookupMimeType(file.path)?.split('/');
      final bytes = await file.readAsBytes();
      final uploadUrl = 'https://api.cloudinary.com/v1_1/$cloudName/auto/upload';

      final request = http.MultipartRequest('POST', Uri.parse(uploadUrl))
        ..fields['upload_preset'] = uploadPreset
        ..files.add(
          http.MultipartFile.fromBytes(
            'file',
            bytes,
            filename: file.name,
            contentType: mimeTypeData != null
                ? MediaType(mimeTypeData[0], mimeTypeData[1])
                : null,
          ),
        );

      final response = await request.send();
      final result = await http.Response.fromStream(response);

      if (response.statusCode == 200) {
        final data = jsonDecode(result.body);
        return data['secure_url'];
      } else {
        print('Failed: ${result.body}');
        return null;
      }
    } catch (e) {
      print('Upload Error: $e');
      return null;
    }
  }
}






// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:mime/mime.dart';
// import 'package:image_picker/image_picker.dart';

// class CloudinaryUpload {
//   static const String cloudName = 'dxkvofpde';
//   static const String uploadPreset = 'flutter_unsigned';

//   Future<String?> uploadFile(XFile file) async {
//     try {
//       final mimeTypeData = lookupMimeType(file.path)?.split('/');
//       final uploadUrl = 'https://api.cloudinary.com/v1_1/$cloudName/auto/upload';

//       final request = http.MultipartRequest('POST', Uri.parse(uploadUrl))
//         ..fields['upload_preset'] = uploadPreset
//         ..files.add(
//           await http.MultipartFile.fromPath(
//             'file',
//             file.path,
//             contentType: mimeTypeData != null
//                 ? MediaType(mimeTypeData[0], mimeTypeData[1])
//                 : null,
//           ),
//         );

//       final response = await request.send();
//       final result = await http.Response.fromStream(response);

//       if (response.statusCode == 200) {
//         final data = jsonDecode(result.body);
//         return data['secure_url'];
//       } else {
//         print('Failed: ${result.body}');
//         return null;
//       }
//     } catch (e) {
//       print('Upload Error: $e');
//       return null;
//     }
//   }
// }
