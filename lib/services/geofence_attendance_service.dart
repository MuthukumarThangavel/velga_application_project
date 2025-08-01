import 'package:geofence_service/geofence_service.dart';
import 'package:geofence_service/models/geofence.dart';
import 'package:geofence_service/models/geofence_radius.dart';

class GeofenceAttendanceService {
  static final GeofenceAttendanceService instance = GeofenceAttendanceService._internal();

  final GeofenceService _service = GeofenceService.instance;

  GeofenceAttendanceService._internal() {
    _service.setup(
      interval: 5000,
      accuracy: 100,
      loiteringDelayMs: 10000,
      statusChangeDelayMs: 10000,
      useActivityRecognition: false, // or true if you need it
      allowMockLocations: false,
      printDevLog: false,
      geofenceRadiusSortType: GeofenceRadiusSortType.DESC,
    );
  }

  void start() {
    _service.start(
      geofenceList: [
        Geofence(
          id: 'office',
          latitude: 12.9716,
          longitude: 77.5946,
          radius: [GeofenceRadius(id: 'office_radius', length: 100)],
        ),
      ],
      activationEvents: [GeofenceEvent.enter, GeofenceEvent.exit],
      androidSettings: AndroidSettings(
        interval: 5000,
        accuracy: LocationAccuracy.high,
        loiteringDelayMs: 10000,
        statusChangeDelayMs: 10000,
      ),
      onGeofenceEvent: (Geofence geofence, GeofenceEvent event) {
        if (event == GeofenceEvent.enter) {
          print('✅ Auto PUNCH IN at ${geofence.latitude}, ${geofence.longitude}');
        } else if (event == GeofenceEvent.exit) {
          print('🚪 Auto PUNCH OUT at ${geofence.latitude}, ${geofence.longitude}');
        }
      },
      onLocationChanged: (location) {
        print('📍 Location changed: $location');
      },
    );
  }

  void stop() => _service.stop();
}
