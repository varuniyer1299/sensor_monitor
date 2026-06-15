import 'package:pulse_monitor/data/sensor_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'data_source_providers.g.dart';

@riverpod
ISensorRemoteDataSource sensorRemoteDataSource(SensorRemoteDataSourceRef ref) {
  return SensorRemoteDataSourceImpl();
}