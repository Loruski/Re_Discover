import 'dart:io';

class DataRetriever {

  static const API_URI = "";

  Future<String> retrieveData() async {
    final serializedRetrievedData = await File(API_URI).readAsString();

    return serializedRetrievedData;
  }

}