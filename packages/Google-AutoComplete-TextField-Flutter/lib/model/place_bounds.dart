import 'dart:math';

class PlaceBounds {
  final double latNE;
  final double lngNE;
  final double latSW;
  final double lngSW;

  PlaceBounds({
    required this.latNE,
    required this.lngNE,
    required this.latSW,
    required this.lngSW
  });

  double get centerLat => (latNE + latSW) / 2;
  double get centerLng => (lngNE + lngSW) / 2;

  double calculateRadius() {
    final double radiusNE = _haversine(centerLat, centerLng, latNE, lngNE);
    final double radiusSW = _haversine(centerLat, centerLng, latSW, lngSW);

    final double radius = max(radiusNE, radiusSW);
    return radius;
  }

  double _haversine(double lat1, double lon1, double lat2, double lon2) {
    const double R = 6371.0;
    final double dLat = (lat2 - lat1) * pi / 180;
    final double dLon = (lon2 - lon1) * pi / 180;

    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * pi / 180) *
            cos(lat2 * pi / 180) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }
}
