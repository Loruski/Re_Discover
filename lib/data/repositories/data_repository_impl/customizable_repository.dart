import 'package:re_discover/data/models/customizable_data.dart';
import 'package:re_discover/data/repositories/abstract_data_repository.dart';
import 'package:re_discover/data/repositories/paths/paths.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/domain/models/customizable.dart';

class CustomizableRepository extends AbstractDataRepository<CustomizableData, Customizable> {
  CustomizableRepository(): super(path: Paths.customizablePath, fromJson: CustomizableData.fromJson,
    assignIds: (List data, Map<Types, AbstractDataRepository>? requiredData) {
      Map<int, Customizable> toSetToHolder = {};
      for (CustomizableData element in data) {
        toSetToHolder[element.id] = Customizable(id: element.id, name: element.name, imgPath: element.imgPath);
      }
      return toSetToHolder;
    });
}