import 'package:pulse_monitor/data/sensor_remote_datasource.dart';
import 'package:pulse_monitor/domain/repositories/sensor_repository.dart';
import 'package:pulse_monitor/domain/sensor_entity.dart';

class SensorRepositoryImpl implements ISensorRepository {
  final ISensorRemoteDataSource _remoteDataSource;
  const SensorRepositoryImpl(this._remoteDataSource);

  @override
  Stream<SensorEntity> watchSensor(String zoneId) {
    return _remoteDataSource.getSensorData(zoneId).map((data) {      
      return SensorEntity(
        id: data.zoneId,
        temperature: data.temperature, // Mapping the DTO fields
        humidity: data.humidity,
        name: data.name,
      );
    });
  }
  
  @override
  Stream<List<String>> watchAllZoneIds() {
    return _remoteDataSource.watchAllZoneIds();
  }
}
