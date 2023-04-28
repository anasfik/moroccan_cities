import 'dart:io';
import 'dart:isolate';

import 'core/base/base.dart';
import 'core/models/city.dart';
import 'core/models/region.dart';
import 'core/utils/utils.dart';

class MoroccanCities implements MoroccanCitiesBase {
  static MoroccanCities get instance => _instance;

  @override
  Stream<MorrocanCity> citiesStream() {
    final file = File.fromUri(Uri.parse('lib/src/core/data/cities.json'));
    final json = file.readAsStringSync();
    final receivePort = ReceivePort();

    Stream<MorrocanCity> stream = Isolate.spawn(
      MorrocanCitiesUtils.decodeAndModelizeCities,
      [receivePort.sendPort, json],
    )
        .asStream()
        .asyncExpand((_) => receivePort)
        .takeWhile((element) => element is MorrocanCity)
        .cast();

    return stream;
  }

  @override
  Stream<MorrocanRegion> regionsStream() {
    final file = File.fromUri(Uri.parse('lib/src/core/data/regions.json'));
    final json = file.readAsStringSync();
    final receivePort = ReceivePort();
    return Isolate.spawn(
      MorrocanCitiesUtils.decodeAndModelizeRegions,
      [receivePort.sendPort, json],
    )
        .asStream()
        .asyncExpand((_) => receivePort)
        .takeWhile((element) => element is MorrocanRegion)
        .cast();
  }

  @override
  Future<List<MorrocanCity>> cities() {
    return citiesStream().toList();
  }

  @override
  Future<List<MorrocanRegion>> regions() {
    return regionsStream().toList();
  }

  static final MoroccanCities _instance = MoroccanCities._();
  MoroccanCities._();
}
