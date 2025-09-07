import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final DateTime dateTime;
  bool isSelected;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    DateTime? dateTime,
    this.isSelected = true,
  }) : dateTime = dateTime ?? DateTime.now();

  // String get formattedPhoneNumber =>
  //     AbFormatter.formattedPhoneNumber(phoneNumber);

  static AddressModel empty() => AddressModel(
    id: '',
    name: '',
    phoneNumber: '',
    street: '',
    city: '',
    state: '',
    postalCode: '',
    country: '',
  );

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Street': street,
      'City': city,
      'State': state,
      'PostalCode': postalCode,
      'Country': country,
      'DateTime': dateTime,
      'IsSelected': isSelected,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      id: data['Id'] as String,
      name: data['Name'] as String,
      phoneNumber: data['PhoneNumber'] as String,
      street: data['Street'] as String,
      city: data['City'] as String,
      state: data['State'] as String,
      postalCode: data['PostalCode'] as String,
      country: data['Country'] as String,
      dateTime: data['DateTime'] is Timestamp ? (data['DateTime'] as Timestamp).toDate() : null,
      isSelected: data['IsSelected'] as bool,
    );
  }

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    final rawDateTime = data['DateTime'];
    print('📦 DateTime raw value: $rawDateTime | Type: ${rawDateTime.runtimeType}');

  DateTime? parsedDateTime;

  if (rawDateTime != null && rawDateTime is Timestamp) {
    parsedDateTime = rawDateTime.toDate();
  } else {
    parsedDateTime = null;
  }
    return AddressModel(
      id: snapshot.id,
      name: data['Name'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      street: data['Street'] ?? '',
      city: data['City'] ?? '',
      state: data['State'] ?? '',
      postalCode: data['PostalCode'] ?? '',
      country: data['Country'] ?? '',
      dateTime: parsedDateTime,
      isSelected: data['IsSelected'] as bool,
    );
  }

  @override
  String toString(){
    return '$street, $city, $state, $postalCode, $country';
  }
}
