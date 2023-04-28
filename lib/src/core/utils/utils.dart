import 'dart:convert';

import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:moroccan_cities/src/core/models/city.dart';
import 'package:moroccan_cities/src/core/models/region.dart';

class MorrocanCitiesUtils {
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
}
