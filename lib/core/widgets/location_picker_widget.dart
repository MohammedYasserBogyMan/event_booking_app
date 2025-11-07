import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/location_service.dart';

class LocationPickerWidget extends StatefulWidget {
  final GeoPoint? initialLocation;
  final String? initialAddress;
  final Function(GeoPoint coordinates, String address) onLocationSelected;

  const LocationPickerWidget({
    super.key,
    this.initialLocation,
    this.initialAddress,
    required this.onLocationSelected,
  });

  @override
  State<LocationPickerWidget> createState() => _LocationPickerWidgetState();
}

class _LocationPickerWidgetState extends State<LocationPickerWidget> {
  GoogleMapController? _mapController;
  final LocationService _locationService = LocationService();

  LatLng? _selectedLocation;
  String _selectedAddress = '';
  bool _isLoading = false;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    if (widget.initialLocation != null) {
      _selectedLocation = LatLng(
        widget.initialLocation!.latitude,
        widget.initialLocation!.longitude,
      );
      _selectedAddress = widget.initialAddress ?? '';
      _addMarker(_selectedLocation!);
    } else {
      // Get current location automatically if no initial location
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          _getCurrentLocation();
        }
      });
    }
  }

  void _addMarker(LatLng position) {
    setState(() {
      _markers = {
        Marker(
          markerId: const MarkerId('selected_location'),
          position: position,
          draggable: true,
          onDragEnd: (newPosition) {
            _onLocationChanged(newPosition);
          },
        ),
      };
    });
  }

  Future<void> _onLocationChanged(LatLng position) async {
    setState(() {
      _isLoading = true;
      _selectedLocation = position;
    });

    final result = await _locationService.getAddressFromCoordinates(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    result.fold(
      (failure) {
        setState(() {
          _selectedAddress = 'Unknown Location';
          _isLoading = false;
        });
      },
      (address) {
        setState(() {
          _selectedAddress = address;
          _isLoading = false;
        });
      },
    );

    _addMarker(position);
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoading = true);

    final result = await _locationService.getCurrentLocationWithAddress();

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.message),
            backgroundColor: Colors.red,
          ),
        );
        setState(() => _isLoading = false);
      },
      (locationData) {
        final coordinates = locationData['coordinates'] as GeoPoint;
        final address = locationData['address'] as String;

        final latLng = LatLng(coordinates.latitude, coordinates.longitude);

        setState(() {
          _selectedLocation = latLng;
          _selectedAddress = address;
          _isLoading = false;
        });

        _addMarker(latLng);
        _mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(latLng, 15),
        );
      },
    );
  }

  void _onMapTap(LatLng position) {
    _onLocationChanged(position);
  }

  void _confirmLocation() {
    if (_selectedLocation != null) {
      final geoPoint = GeoPoint(
        _selectedLocation!.latitude,
        _selectedLocation!.longitude,
      );
      widget.onLocationSelected(geoPoint, _selectedAddress);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
        actions: [
          if (_selectedLocation != null)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _confirmLocation,
            ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _selectedLocation ?? const LatLng(30.0444, 31.2357), // Cairo default
              zoom: 12,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            onTap: _onMapTap,
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),

          // Address display card
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: _isLoading
                    ? const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          SizedBox(width: 12),
                          Text('Loading address...'),
                        ],
                      )
                    : Text(
                        _selectedAddress.isEmpty
                            ? 'Tap on map to select location'
                            : _selectedAddress,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
            ),
          ),

          // Current location button
          Positioned(
            bottom: 80,
            right: 16,
            child: FloatingActionButton(
              onPressed: _isLoading ? null : _getCurrentLocation,
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.my_location),
            ),
          ),

          // Confirm button
          if (_selectedLocation != null)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: _confirmLocation,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Confirm Location',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
