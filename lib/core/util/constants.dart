
import 'dart:io';

import 'package:bima_application/features/data/datasources/binding/tables/doctor_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Constants {
  ///Api for fetching doctor list
  static const String apiUri = "https://5efdb0b9dd373900160b35e2.mockapi.io/contacts";

/// To initialize hive
  static Future<void> initDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  ///  Register our auto generated Adapter to our Hive database
  static void registerAdapter<Type>(TypeAdapter<Type> adapter) {
    try {
      Hive.registerAdapter(adapter);
    } on HiveError catch (error) {
      debugPrint(error.toString());
    }
  }



}