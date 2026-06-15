import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_monitor/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'zone_list_provider.g.dart';

@riverpod
Stream<List<String>> sensorList(Ref ref) {
  return ref.watch(sensorRepositoryProvider).watchAllZoneIds();
}