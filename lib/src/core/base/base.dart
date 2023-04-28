import '../models/city.dart';
import '../models/region.dart';

abstract class MoroccanCitiesBase {
  Stream<MorrocanCity> citiesStream();
  Future<List<MorrocanCity>> cities();
  Stream<MorrocanRegion> regionsStream();
  Future<List<MorrocanRegion>> regions();
}
