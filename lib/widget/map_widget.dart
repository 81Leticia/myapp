import 'package:flutter/material.dart';



class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}


class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;


  final LatLng _initialPosition = LatLng(-23.550520, -46.633308); // São Paulo


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // Define a altura do mapa
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 0.8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(70),
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _initialPosition,
            zoom: 4,
          ),
          markers: {
            Marker(
              markerId: MarkerId("consulta"),
              position: _initialPosition,
              infoWindow: InfoWindow(title: "Local da Consulta"),
            ),
          },
        ),
      ),
    );
  }
}









