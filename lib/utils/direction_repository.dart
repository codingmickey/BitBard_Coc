import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'direction_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsRepository {
  static const String _baseUrl = 'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '19.107532915492392, 72.83712452428492',
        'destination': '${destination.latitude}, ${destination.longitude}',
        'key': 'AIzaSyBJW5dQc0jq1gajvy7MkH1JmxYRgHgCTk4',
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }
}
