import 'package:pulse_monitor/domain/sensor_entity.dart';
import 'package:pulse_monitor/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sensor_notifier.g.dart';

@riverpod
class SensorMonitor extends _$SensorMonitor {
  @override
  Stream<SensorEntity> build(String zoneId) {
    final repo = ref.watch(sensorRepositoryProvider);
    final entity = repo.watchSensor(zoneId);
    return entity;
  }
}