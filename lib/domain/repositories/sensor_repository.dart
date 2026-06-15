import 'package:pulse_monitor/domain/sensor_entity.dart';

abstract class ISensorRepository {
  Stream<SensorEntity> watchSensor(String zoneId);
  Stream<List<String>> watchAllZoneIds();
}