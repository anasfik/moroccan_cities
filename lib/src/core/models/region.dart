import 'package:meta/meta.dart';

/// {@template morrocan_region}
@immutable
class MorrocanRegion {
  /// The id of the region
  final String id;

  /// The name of the region
  final String name;

  /// {@template morrocan_region}
  /// Represents a region in Morocco.
  /// {@endtemplate}
  const MorrocanRegion({
    required this.id,
    required this.name,
  });

  /// Creates a [MorrocanRegion] from a JSON object.
  factory MorrocanRegion.fromJson(Map<String, dynamic> json) {
    return MorrocanRegion(
      id: json['id'],
      name: json['region'],
    );
  }

  @override
  String toString() {
    return 'Region{id: $id, name: $name}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MorrocanRegion &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
