import 'dart:math' as math;
import 'package:geolocator/geolocator.dart';

class LocationService {
  static const double earthRadiusMeters = 6371000.0;

  static double calculateDistanceInMeters({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  }) {
    return Geolocator.distanceBetween(
      startLat,
      startLng,
      endLat,
      endLng,
    );
  }

  static bool isShopWithinRadius({
    required double userLat,
    required double userLng,
    required double shopLat,
    required double shopLng,
    double radiusInMeters = 500.0,
  }) {
    final distance = calculateDistanceInMeters(
      startLat: userLat,
      startLng: userLng,
      endLat: shopLat,
      endLng: shopLng,
    );
    return distance <= radiusInMeters;
  }

  static double calculateBearing({
    required double userLat,
    required double userLng,
    required double shopLat,
    required double shopLng,
  }) {
    final startLatRad = _degreesToRadians(userLat);
    final startLngRad = _degreesToRadians(userLng);
    final endLatRad = _degreesToRadians(shopLat);
    final endLngRad = _degreesToRadians(shopLng);

    final dLng = endLngRad - startLngRad;

    final y = math.sin(dLng) * math.cos(endLatRad);
    final x = math.cos(startLatRad) * math.sin(endLatRad) -
        math.sin(startLatRad) * math.cos(endLatRad) * math.cos(dLng);

    final bearingRad = math.atan2(y, x);
    final bearingDeg = (_radiansToDegrees(bearingRad) + 360) % 360;

    return bearingDeg;
  }

  static String getDirectionName(double bearingInDegrees) {
    const directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    final index = ((bearingInDegrees + 22.5) % 360 / 45).floor();
    return directions[index];
  }

  static double _degreesToRadians(double degrees) {
    return degrees * (math.pi / 180.0);
  }

  static double _radiansToDegrees(double radians) {
    return radians * (180.0 / math.pi);
  }
}
