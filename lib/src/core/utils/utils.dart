import 'dart:convert';

import 'dart:io';
import 'dart:isolate';

import 'package:meta/meta.dart';
import 'package:moroccan_cities/src/core/models/city.dart';
import 'package:moroccan_cities/src/core/models/region.dart';

/// Represents utilities for [MorrocanCity] and [MorrocanRegion] classes.
@internal
class MorrocanCitiesUtils {
  /// Decodes and modelizes the cities from the given [json] string in different [Isolate].
  static void decodeAndModelizeCities(List list) {
    final SendPort sendPort = list[0];
    final String json = list[1];
    final cities = jsonDecode(json) as List<dynamic>;
    for (var i = 0; i < cities.length; i++) {
      final city = cities[i];
      sendPort.send(MorrocanCity.fromJson(city));
    }

    sendPort.send(null);
  }

  /// Decodes and modelizes the regions from the given [json] string in different [Isolate].
  static void decodeAndModelizeRegions(List list) {
    final SendPort sendPort = list[0];
    final String json = list[1];
    final regions = jsonDecode(json) as List<dynamic>;
    for (var i = 0; i < regions.length; i++) {
      final region = regions[i];
      sendPort.send(MorrocanRegion.fromJson(region));
    }

    sendPort.send(null);
  }

  /// Returns the content of the file in the given [relativePath].
  static String fileContent(String relativePath) {
    final file = File.fromUri(Uri.parse(relativePath));
    return file.readAsStringSync();
  }
}
