import 'package:moroccan_cities/moroccan_cities.dart';
import 'package:moroccan_cities/src/core/models/city.dart';
import 'package:moroccan_cities/src/core/utils/utils.dart';

void main() async {
  final regions = await MoroccanCities.instance.regions();
  final firstRegionCities =
      await MoroccanCities.instance.citiesOfRegion(regions.last);
  print(firstRegionCities);
}
