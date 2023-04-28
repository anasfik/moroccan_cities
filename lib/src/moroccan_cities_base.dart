import 'dart:isolate';

import 'core/base/base.dart';
import 'core/models/city.dart';
import 'core/models/region.dart';
import 'core/utils/utils.dart';

/// {@template moroccan_cities}
/// Represents a singleton class that provides methods for accessing [Future]s and [Stream]s of [MorrocanCity]ies and [MorrocanRegion]s
///
/// You can access the singleton instance of this class using [MoroccanCities.instance]
///
/// ```dart
/// MoroccanCities.instance;
/// ```
/// {@endtemplate}
class MoroccanCities implements MoroccanCitiesBase {
  /// {@macro moroccan_cities}
  static MoroccanCities get instance => _instance;

  /// Returns a [Stream] of [MorrocanCity] of all cities in Morocco.
  ///
  /// ```dart
  /// MoroccanCities.instance.citiesStream().listen((city) {
  ///  print(city.id);
  ///  print(city.name);
  /// });
  /// ```
  @override
  Stream<MorrocanCity> citiesStream() {
    final json =
        MorrocanCitiesUtils.fileContent("lib/src/core/data/cities.json");
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

  /// Returns a [Stream] of [MorrocanRegion] of all regions in Morocco.
  /// ```dart
  /// MoroccanCities.instance.regionsStream().listen((region) {
  /// print(region.id);
  /// print(region.name);
  /// });
  @override
  Stream<MorrocanRegion> regionsStream() {
    final json =
        MorrocanCitiesUtils.fileContent("lib/src/core/data/regions.json");

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

  /// Returns a [Future] of [List] of [MorrocanCity] for all cities in Morocco.
  ///
  /// ```dart
  /// MoroccanCities.instance.cities().then((cities) {
  /// print(cities);
  /// });
  /// ```
  @override
  Future<List<MorrocanCity>> cities() {
    return citiesStream().toList();
  }

  /// Returns a [Future] of [List] of [MorrocanRegion] for all regions in Morocco.
  ///
  /// ```dart
  /// MoroccanCities.instance.regions().then((regions) {
  /// print(regions);
  /// });
  /// ```
  @override
  Future<List<MorrocanRegion>> regions() {
    return regionsStream().toList();
  }

  /// Returns a [Stream] of [MorrocanCity] of all cities in a [MorrocanRegion].
  /// ```dart
  /// MoroccanCities.instance.citiesOfRegionStream(regions.last).listen((city) {
  /// print(city.id);
  /// print(city.name);
  /// });
  /// ```
  @override
  Stream<MorrocanCity> citiesOfRegionStream(MorrocanRegion region) {
    return citiesStream().where((element) => element.region == region.id);
  }

  /// Returns a [Future] of [List] of [MorrocanCity] for all cities in a [MorrocanRegion].
  /// ```dart
  /// MoroccanCities.instance.citiesOfRegion(regions.last).then((cities) {
  /// print(cities);
  /// });
  /// ```
  @override
  Future<List<MorrocanCity>> citiesOfRegion(MorrocanRegion region) {
    return citiesOfRegionStream(region).toList();
  }

  /// {@macro moroccan_cities}
  static final MoroccanCities _instance = MoroccanCities._();

  /// {@macro moroccan_cities}
  MoroccanCities._();
}
