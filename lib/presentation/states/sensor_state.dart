import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pulse_monitor/domain/sensor_entity.dart';
part 'sensor_state.freezed.dart';

@freezed
sealed class SensorState with _$SensorState {
  const factory SensorState.loading() = _Loading;
  const factory SensorState.data(SensorEntity entity) = _Data;
  const factory SensorState.error(String message) = _Error;
}