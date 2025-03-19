/*import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final String totalDistance;
  final String totalDuration;

  const Directions({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  static Directions? fromMap(Map<String, dynamic> map) {

    if ((map['routes'] as List).isEmpty) return null;


    final data = Map<String, dynamic>.from(map['routes'][0]);


    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat'], northeast['lng']),
      southwest: LatLng(southwest['lat'], southwest['lng']),
    );

    // Distance & Duration
    String distance = '';
    String duration = '';
    if ((data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }

    return Directions(
      bounds: bounds,
      polylinePoints: PolylinePoints().decodePolyline(data['overview_polyline']['points']),
      totalDistance: distance,
      totalDuration: duration,
    );
  }
}*/
import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final String totalDistance;
  final String totalDuration;

  const Directions({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  static Directions? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      debugPrint("🚨 ERROR: The API response is NULL.");
      return null;
    }

    if (!map.containsKey('routes') || (map['routes'] as List).isEmpty) {
      debugPrint("🚨 ERROR: No 'routes' found in API response.");
      return null;
    }

    final data = Map<String, dynamic>.from(map['routes'][0]);

    if (!data.containsKey('bounds') ||
        !data.containsKey('legs') ||
        !data.containsKey('overview_polyline')) {
      debugPrint("🚨 ERROR: Missing necessary fields in API response.");
      return null;
    }

    debugPrint("✅ API Response: ${map.toString()}");

    // Extract bounds safely
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];

    if (northeast == null || southwest == null) {
      debugPrint("🚨 ERROR: Missing 'bounds' data.");
      return null;
    }

    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat'], northeast['lng']),
      southwest: LatLng(southwest['lat'], southwest['lng']),
    );

    // Extract distance & duration safely
    String distance = '';
    String duration = '';
    if ((data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];

      if (leg.containsKey('distance') && leg['distance'] != null) {
        distance = leg['distance']['text'];
      } else {
        debugPrint("🚨 ERROR: Distance data is missing.");
      }

      if (leg.containsKey('duration') && leg['duration'] != null) {
        duration = leg['duration']['text'];
      } else {
        debugPrint("🚨 ERROR: Duration data is missing.");
      }
    }

    return Directions(
      bounds: bounds,
      polylinePoints: data['overview_polyline'] != null
          ? PolylinePoints().decodePolyline(data['overview_polyline']['points'])
          : [],
      totalDistance: distance,
      totalDuration: duration,
    );
  }
}
