// import 'package:flutter/material.dart';

// class AbCheckboxTheme {
//   const AbCheckboxTheme._();

//   static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//     checkColor: MaterialStateProperty.resolveWith((status){
//       if(status.contains(MaterialState.selected)) {
//         return Colors.white;
//       }
//       else {
//         return Colors.black;
//       }
//     }),
//     fillColor: MaterialStateProperty.resolveWith((status) {
//       if(status.contains(MaterialState.selected)) {
//         return Colors.blue;
//       }
//       else {
//         return Colors.transparent;
//       }
//     }));

//   static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//     checkColor: MaterialStateProperty.resolveWith((status){
//       if(status.contains(MaterialState.selected)) {
//         return Colors.white;
//       }
//       else {
//         return Colors.white;
//       }
//     }),
//     fillColor: MaterialStateProperty.resolveWith((status) {
//       if(status.contains(MaterialState.selected)) {
//         return Colors.blue;
//       }
//       else {
//         return Colors.transparent;
//       }
//     }));
// }