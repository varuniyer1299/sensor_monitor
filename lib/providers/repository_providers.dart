import 'package:pulse_monitor/data/sensor_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/repositories/sensor_repository.dart';
import 'data_source_providers.dart'; // Where your datasource is defined

part 'repository_providers.g.dart';

@riverpod
ISensorRepository sensorRepository(SensorRepositoryRef ref) {
  final dataSource = ref.watch(sensorRemoteDataSourceProvider);
  return SensorRepositoryImpl(dataSource);
}