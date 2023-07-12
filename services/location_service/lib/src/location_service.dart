import 'package:core_dependencies/location.dart';

class LocationService {
  Location location = Location();

  Future<(bool, PermissionStatus)> requestPermission() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }
    return (serviceEnabled, permissionGranted);
  }

  Stream<LocationData> onLocationChanges() => location.onLocationChanged;
}

extension StatusExtension on PermissionStatus? {
  String get value {
    switch (this) {
      case PermissionStatus.denied:
        return 'Denied';
      case PermissionStatus.deniedForever:
        return 'Denied forever';
      case PermissionStatus.granted:
        return 'Granted';
      case PermissionStatus.grantedLimited:
        return 'Granted limited';
      case null:
        return '-';
    }
  }
}
