import 'package:moroccan_cities/moroccan_cities.dart';

void main() async {
  MoroccanCities.instance.citiesStream().listen(
    (event) {
      print("city: ${event.name}");
    },
  );

  MoroccanCities.instance.regionsStream().listen((event) {
    print("region: ${event.name}");
  });
}
