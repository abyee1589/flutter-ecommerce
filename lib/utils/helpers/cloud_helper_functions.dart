
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/exceptions/user_exceptions.dart';

class AbCloudHelperFunctions {

  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if(snapshot.connectionState == ConnectionState.waiting){
      return const Center(child: CircularProgressIndicator());
    }
    if(!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('No Data Found!'));
    }

    if(snapshot.hasError) {
      return const Center(child: Text('Something went wrong!'));
    }
    return null;
  }

  static Widget? checkMultipleRecordState<T>({required AsyncSnapshot<List<T>> snapshot, Widget? loader, Widget? error, Widget? nothingFound}) {
    if(snapshot.connectionState == ConnectionState.waiting){
      if(loader != null) return loader;
      return const Center(child: CircularProgressIndicator());
    }

    if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if(nothingFound != null ) return nothingFound;
      return const Center(child: Text('No Data Found!'));
    }

    if(snapshot.hasError) {
      if(error != null) return error;
      return const Center(child: Text('Something went wrong!'));
    }
    return null;
  }

  // static Future<String> getURLFromPathAndName(String path) async{
  //   try{
      
  //   } on FirebaseException catch (e) {
  //     throw AbFirebaseException(e.code);
  //   } on PlatformException catch (e) {
  //     throw AbPlatformException(e.code);
  //   } catch (e) {
  //     throw Exception('Something went wrong: ${e.toString()}');
  //   }
  // }
}