import 'dart:io';



class DataRetriever {

  Future<String> retrieveData(String path) async {
    final serializedRetrievedData = await File(path).readAsString();

    return serializedRetrievedData;
  }
}