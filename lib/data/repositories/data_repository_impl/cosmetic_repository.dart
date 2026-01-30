import 'package:re_discover/data/models/cosmetic_data.dart';
import 'package:re_discover/data/repositories/abstract_data_repository.dart';
import 'package:re_discover/data/repositories/static_repo_settings/paths.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/domain/models/cosmetic.dart';

class CosmeticRepository extends AbstractDataRepository<CosmeticData, Cosmetic> {
  CosmeticRepository(): super(
    path: Paths.cosmeticsPath,
    fromJson: CosmeticData.fromJson,
    toJson: (Cosmetic element) {
      CosmeticData cosmeticData = CosmeticData(id: element.id, name: element.name, imgPath: element.imgPath);
      return cosmeticData.toJson();
    },
    assignIds: (List data, Map<Types, AbstractDataRepository>? requiredData) {
      Map<int, Cosmetic> toSetToHolder = {};
      for (CosmeticData element in data) {
        toSetToHolder[element.id] = Cosmetic(id: element.id, name: element.name, imgPath: element.imgPath);
      }
      return toSetToHolder;
    });
}