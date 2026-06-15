import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_monitor/presentation/notifiers/zone_list_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_monitor/presentation/pages/error_screen.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zonesAsync = ref.watch(sensorListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Sensor Dashboard"),centerTitle: true,),
      body: zonesAsync.when(
        data: (zoneIds) => zoneIds.isEmpty
            ? ErrorScreen(
                title: 'No sensors found!',
                message: 'It looks like there are no active zones right now',
                onRetry: () => ref.invalidate(sensorListProvider),
              )
            : ListView.builder(
                itemCount: zoneIds.length,
                itemBuilder: (context, index) {
                  final zoneId = zoneIds[index];
                  return ListTile(
                    title: Text("Zone: $zoneId"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      context.push('/sensor/$zoneId');
                    },
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => ErrorScreen(
          title: 'Error',
          message: err.toString(),
          onRetry: () => ref.invalidate(sensorListProvider),
        ),
      ),
    );
  }
}
