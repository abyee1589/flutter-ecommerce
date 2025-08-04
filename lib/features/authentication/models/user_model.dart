import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String username;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.username,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';

  static List<String> nameParts(String fullName) => fullName.split(' ');

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(' ');
    String first = nameParts[0].toLowerCase();
    String last = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';
    return 'cwt_${first}${last}';
  }

  // String get formattedPhoneNumber => AbFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to create empty user model
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        email: '',
        phoneNumber: '',
        username: '',
        profilePicture: '',
      );

  /// Convert user model to JSON format to store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'username': username,
      'profilePicture': profilePicture,
    };
  }
  
  /// Factory method to create user model from firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phoneNumber'] ?? '',
        username: data['username'] ?? '',
        profilePicture: data['profilePicture'] ?? '',
      );
    } else {
      // Return an empty model or throw a custom error
      return UserModel.empty();
    }
  }
}
