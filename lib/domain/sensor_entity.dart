class SensorEntity {
  final String id;
  final String name;
  final double temperature;
  final double humidity;
  SensorEntity({
    required this.id,
    required this.name,
    required this.temperature,
    required this.humidity,
  });

  factory SensorEntity.fromMap(String id, Map<String, dynamic> map) {
    return SensorEntity(
      id: id,
      name: map['name'] ?? 'Unknown Sensor',
      temperature: (map['temperature'] as num).toDouble(),
      humidity: (map['humidity'] as num).toDouble(),
    );
  }
}
