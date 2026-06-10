import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<String> getCurrentCity() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return 'Istanbul';

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return 'Istanbul';
      }

      if (permission == LocationPermission.deniedForever) return 'Istanbul';

      final position = await Geolocator.getCurrentPosition();
      return '${position.latitude},${position.longitude}';
    } catch (e) {
      return 'Istanbul';
    }
  }
}
