import 'dart:convert';
import 'package:re_discover/data/services/data_retriever.dart';

// class Paths {
//   static const String city = "lib/data/mockData/Cities.json";
// }


class DataHandler<T> {
  final dataRetriever = DataRetriever();
  final T Function(Map<String, dynamic>) fromJson;
  final String path;

  DataHandler({required this.path, required this.fromJson});

  Future<List<T>> bakeDataModels() async {
    final serializedRetrievedData = await dataRetriever.retrieveData(path);
    final decodedSerializedRetrievedData = jsonDecode(serializedRetrievedData) as Map<String, dynamic>;

    List<T> data = [];

    
    // (decodedSerializedRetrievedData["Array"] as List<Map<String, dynamic>>).forEach((element) {
    //   _data.add(fromJson(element));
    // });
    for (var element in (decodedSerializedRetrievedData["Array"] as List<dynamic>)) {
      data.add(fromJson(element));
    }


    return data;
  }

}