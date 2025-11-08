import 'dart:convert';
import 'package:re_discover/data/services/dataRetriever.dart';

class DataHandler<T> {
  final dataRetriever = DataRetriever();
  final T Function(Map<String, dynamic>) fromJson;

  DataHandler({required this.fromJson});

  Future<T> bakeDataModels(typeOfDataToBeRetrieved) async {
    final serializedRetrievedData = await dataRetriever.retrieveData();
    final decodedSerializedRetrievedData = jsonDecode(serializedRetrievedData) as Map<String, dynamic>;

    return fromJson(decodedSerializedRetrievedData);
  }



}