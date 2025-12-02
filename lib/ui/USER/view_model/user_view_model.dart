import 'package:flutter/foundation.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/domain/models/badge.dart';

class UserViewModel extends ChangeNotifier {

  late List<Badge> badges;


  Future<void> initState() async {

    badges = await RepositoryHub().badges;
    notifyListeners();

  }


}
