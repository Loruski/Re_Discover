import 'dart:async';
import 'dart:developer';

import 'package:re_discover/data/models/listenable_data_holder.dart';
import 'package:re_discover/data/repositories/data_handler.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';


/// it's ideal to not instantiate this and extending classes for resource access, but instead use CentralRepository for that purpose
abstract class DataRepository<TData, T> { 

  ListenableDataHolder<T> holder = ListenableDataHolder<T>(); // the data container

  /// The path from which to fetch data
  final String path;

  /// the function necessary for extracting data from json, defined in each [Model]Data
  late TData Function(Map<String, dynamic>) fromJson; 

  /// Necessary repositories for building objects made of objects, use the enum in central repository for the key, the corresponding repository itself as the value
  late Map<Types, DataRepository>? requiredData; 

  /// function to specify how to create T objects from TData objects, using the requiredData defined earlier
  /// the objects should be inserted following the pattern (object.ID, object)
  late Map<int, T> Function(List<TData>, Map<Types, DataRepository>? requiredData) assignIds; 


  Future<void>? updateFutureLock; // lock necessary to prevent multiple simultaneous executions of the same update function

  DataRepository({required this.path, required this.fromJson, this.requiredData, required this.assignIds});

  Future<List<T>> get data async { // to be eventually expanded when update versions are introduced, comparing update versions, and if different, execute update
    if(holder.data.isEmpty) await update();
    return holder.data.values.toList();
  }

  T? get (int id) => holder.data[id];

  

  Future<List<TData>> _getData (TData Function(Map<String, dynamic>) fromJson) async {
    DataHandler<TData> dataHandler = DataHandler<TData>(path: path, fromJson: fromJson);
    return await dataHandler.bakeDataModels();
  }   

  Future<void> update() async {
    if (updateFutureLock != null) {
      return updateFutureLock;
    }

    final completer = Completer<void>();
    updateFutureLock = completer.future;
    
    try {
      List<TData> data = await _getData(fromJson);

      List<Future<void>> requiredUpdatesFutures = (requiredData?.values ?? []).map((repo) => repo.update()).toList();
      if (requiredUpdatesFutures.isNotEmpty) await Future.wait(requiredUpdatesFutures);

      Map<int, T> toSetToHolder = assignIds(data, requiredData);
      // for(TData element in data) {
        
      // }
      
      holder.setData(toSetToHolder);
      completer.complete();
    } catch (e, s) {
      completer.completeError(e, s);
      log(e.toString());
      log(s.toString());
      // rethrow;  
    } finally {
      updateFutureLock = null;
    }
  }
}