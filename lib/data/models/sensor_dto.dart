import 'package:json_annotation/json_annotation.dart';

part 'sensor_dto.g.dart';

@JsonSerializable()
class SensorDTO {
  @JsonKey(name: 'zone_id')
  final String zoneId;

  final String name;
  
  final double temperature;
  final double humidity;

  SensorDTO({
    required this.name,
    required this.zoneId,
    required this.temperature,
    required this.humidity,
  });

  factory SensorDTO.fromJson(Map<String, dynamic> json) => _$SensorDTOFromJson(json);
  
  Map<String, dynamic> toJson() => _$SensorDTOToJson(this);
}