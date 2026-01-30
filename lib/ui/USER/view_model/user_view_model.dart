import 'package:flutter/foundation.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/domain/models/badge.dart';
import 'package:re_discover/domain/models/cosmetic.dart';

class UserViewModel extends ChangeNotifier {

  late List<Badge> badges;
  late List<Cosmetic> cosmetics;


  Future<void> initState() async {
    badges = await RepositoryHub().badges;
    cosmetics = await RepositoryHub().cosmetics;
    notifyListeners();
  }


}
