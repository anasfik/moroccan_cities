import 'package:moroccan_cities/moroccan_cities.dart';

void main() async {
  final a = await MoroccanCities.instance.cities();
  print(a);
}
