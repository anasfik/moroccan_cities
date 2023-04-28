import 'package:moroccan_cities/moroccan_cities.dart';

void main() async {
  final regions = await MoroccanCities.instance.regions();
  final firstRegionCities =
      await MoroccanCities.instance.citiesOfRegion(regions.last);
  print(firstRegionCities);
}
