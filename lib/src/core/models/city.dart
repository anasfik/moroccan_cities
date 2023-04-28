import 'package:meta/meta.dart';

/// {@template morrocan_city}
@immutable
class MorrocanCity {
  /// The id of the city
  final String id;

  /// The name of the city
  final String name;

  /// The name of the region where the city is located
  final String region;

  /// {@template morrocan_city}
  /// Represents a city in Morocco.
  /// {@endtemplate}
  const MorrocanCity({
    required this.id,
    required this.name,
    required this.region,
  });

  /// Creates a [MorrocanCity] from a JSON object.
  factory MorrocanCity.fromJson(Map<String, dynamic> json) {
    return MorrocanCity(
      id: json['id'],
      name: json['ville'],
      region: json['region'],
    );
  }

  @override
  String toString() {
    return 'MorrocanCity{id: $id, name: $name, region: $region}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MorrocanCity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          region == other.region;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ region.hashCode;
}
