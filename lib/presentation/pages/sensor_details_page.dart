import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulse_monitor/presentation/notifiers/sensor_notifier.dart';
import 'package:pulse_monitor/presentation/pages/error_screen.dart'; 

class SensorDetailsPage extends ConsumerWidget {
  final String zoneId;

  const SensorDetailsPage({super.key, required this.zoneId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sensorState = ref.watch(sensorMonitorProvider(zoneId));

    return Scaffold(
      appBar: AppBar(
        title: Text("Zone: $zoneId"),
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(sensorMonitorProvider(zoneId).future),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: sensorState.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => ErrorScreen(
              title: "Connection Error",
              message: "We couldn't load the data for this zone.",
              icon: Icons.error_outline,
              onRetry: () => ref.invalidate(sensorMonitorProvider(zoneId)),
            ),
            data: (sensor) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSensorCard(
                  title: "Temperature",
                  value: "${sensor.temperature}°C",
                  icon: Icons.thermostat,
                  color: Colors.orange,
                ),
                const SizedBox(height: 16),
                _buildSensorCard(
                  title: "Humidity",
                  value: "${sensor.humidity}%",
                  icon: Icons.water_drop,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSensorCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}