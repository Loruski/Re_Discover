import 'dart:convert';
import 'package:re_discover/data/models/AbstractDataModel.dart';
import 'package:re_discover/data/services/data_retriever.dart';

class DataHandler<T> {
  final dataRetriever = DataRetriever();
  final T Function(Map<String, dynamic>) fromJson;

  DataHandler({required this.fromJson});

  Future<List<T>> bakeDataModels() async {
    final serializedRetrievedData = await dataRetriever.retrieveData();
    final decodedSerializedRetrievedData = jsonDecode(serializedRetrievedData) as Map<String, dynamic>;

    List<T> _data = [];

    
    (decodedSerializedRetrievedData["Array"] as List<Map<String, dynamic>>).forEach((element) {
      _data.add(fromJson(element));
    });


    return _data;
  }

}