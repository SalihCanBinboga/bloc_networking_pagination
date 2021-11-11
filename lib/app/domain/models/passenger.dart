import 'dart:convert';

class Passenger {
  final String id;
  final String name;
  final int trips;
  Passenger({
    required this.id,
    required this.name,
    required this.trips,
  });

  Passenger copyWith({
    String? id,
    String? name,
    int? trips,
  }) {
    return Passenger(
      id: id ?? this.id,
      name: name ?? this.name,
      trips: trips ?? this.trips,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'trips': trips,
    };
  }

  factory Passenger.fromMap(Map<String, dynamic> map) {
    return Passenger(
      id: map['_id'],
      name: map['name'],
      trips: map['trips'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Passenger.fromJson(String source) => Passenger.fromMap(json.decode(source));

  @override
  String toString() => 'Passenger(id: $id, name: $name, trips: $trips)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Passenger &&
      other.id == id &&
      other.name == name &&
      other.trips == trips;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ trips.hashCode;
}
