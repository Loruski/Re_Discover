import 'package:re_discover/data/models/badge_data.dart';
import 'package:re_discover/data/repositories/abstract_data_repository.dart';
import 'package:re_discover/data/repositories/paths/paths.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/domain/models/badge.dart';

class BadgeRepository extends AbstractDataRepository<BadgeData, Badge> {
  BadgeRepository(): super(path: Paths.badgePath, fromJson: BadgeData.fromJson,
    assignIds: (List data, Map<Types, AbstractDataRepository>? requiredData) {
      Map<int, Badge> toSetToHolder = {};
      for (BadgeData element in data) {
        toSetToHolder[element.id] = Badge(id: element.id, name: element.name, imgPath: element.imgPath);
      }
      return toSetToHolder;
    });

}