import 'package:pulse_monitor/data/models/sensor_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ISensorRemoteDataSource {
  Stream<SensorDTO> getSensorData(String zoneId);
  Stream<List<String>> watchAllZoneIds();
}

class SensorRemoteDataSourceImpl implements ISensorRemoteDataSource {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Stream<SensorDTO> getSensorData(String zoneId) {
    return _db.collection('sensors').doc(zoneId).snapshots().map((snapshot) {
      final data = snapshot.data();
      if (data == null) throw Exception("Document does not exist");
      return SensorDTO.fromJson(data);
    });
  }

  @override
  Stream<List<String>> watchAllZoneIds() {
    return _db.collection('sensors').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.id).toList();
    });
  }
}