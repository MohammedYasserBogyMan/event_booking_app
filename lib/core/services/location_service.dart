import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../failure/errors.dart';

class LocationService {
  /// Check if location services are enabled and permission is granted
  Future<Either<Failure, bool>> checkLocationPermission() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Left(
          ServerFailure(
            errMessage: 'Location services are disabled. Please enable them.',
          ),
        );
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Left(
            ServerFailure(
              errMessage: 'Location permission denied.',
            ),
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Left(
          ServerFailure(
            errMessage:
                'Location permissions are permanently denied. Please enable them in settings.',
          ),
        );
      }

      return const Right(true);
    } catch (e) {
      return Left(
        ServerFailure(
          errMessage: 'Error checking location permission: ${e.toString()}',
        ),
      );
    }
  }

  /// Get current user location
  Future<Either<Failure, Position>> getCurrentLocation() async {
    try {
      final permissionCheck = await checkLocationPermission();
      if (permissionCheck.isLeft()) {
        return Left(
          permissionCheck.fold(
            (failure) => failure,
            (_) => ServerFailure(errMessage: 'Unknown error'),
          ),
        );
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );

      return Right(position);
    } catch (e) {
      return Left(
        ServerFailure(
          errMessage: 'Error getting current location: ${e.toString()}',
        ),
      );
    }
  }

  /// Convert coordinates to address (Reverse Geocoding)
  Future<Either<Failure, String>> getAddressFromCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      if (placemarks.isEmpty) {
        return Left(
          ServerFailure(
            errMessage: 'No address found for these coordinates.',
          ),
        );
      }

      Placemark place = placemarks[0];

      // Build address string
      String address = '';
      if (place.locality != null && place.locality!.isNotEmpty) {
        address += place.locality!;
      }
      if (place.country != null && place.country!.isNotEmpty) {
        if (address.isNotEmpty) address += ', ';
        address += place.country!;
      }

      if (address.isEmpty) {
        address = 'Unknown Location';
      }

      return Right(address);
    } catch (e) {
      return Left(
        ServerFailure(
          errMessage: 'Error getting address: ${e.toString()}',
        ),
      );
    }
  }

  /// Convert address to coordinates (Forward Geocoding)
  Future<Either<Failure, GeoPoint>> getCoordinatesFromAddress({
    required String address,
  }) async {
    try {
      List<Location> locations = await locationFromAddress(address);

      if (locations.isEmpty) {
        return Left(
          ServerFailure(
            errMessage: 'No coordinates found for this address.',
          ),
        );
      }

      Location location = locations[0];
      GeoPoint geoPoint = GeoPoint(location.latitude, location.longitude);

      return Right(geoPoint);
    } catch (e) {
      return Left(
        ServerFailure(
          errMessage: 'Error getting coordinates: ${e.toString()}',
        ),
      );
    }
  }

  /// Calculate distance between two coordinates in kilometers
  double calculateDistance({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2) / 1000;
  }

  /// Get current location with address
  Future<Either<Failure, Map<String, dynamic>>> getCurrentLocationWithAddress()
      async {
    try {
      final positionResult = await getCurrentLocation();

      if (positionResult.isLeft()) {
        return Left(
          positionResult.fold(
            (failure) => failure,
            (_) => ServerFailure(errMessage: 'Unknown error'),
          ),
        );
      }

      Position position = positionResult.fold(
        (_) => throw Exception('Should not happen'),
        (pos) => pos,
      );

      final addressResult = await getAddressFromCoordinates(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      String address = addressResult.fold(
        (_) => 'Unknown Location',
        (addr) => addr,
      );

      return Right({
        'address': address,
        'coordinates': GeoPoint(position.latitude, position.longitude),
        'latitude': position.latitude,
        'longitude': position.longitude,
      });
    } catch (e) {
      return Left(
        ServerFailure(
          errMessage: 'Error getting location with address: ${e.toString()}',
        ),
      );
    }
  }
}
