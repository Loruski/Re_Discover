
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/domain/models/city.dart';

RepositoryHub hub = RepositoryHub();

void main() async{
  List<City> a = await hub.cities;

  print(a[0]);
}