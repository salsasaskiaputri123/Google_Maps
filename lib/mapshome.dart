import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class MapsHome extends StatefulWidget {
  const MapsHome({super.key});

  @override
  State<MapsHome> createState() => _MapsHomeState();
}

class _MapsHomeState extends State<MapsHome> {
  String locationaddress = 'search for a location';
  double latitude = -6.5946;
  double longitude = 106.7899; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Home'),
      ),
      body: Center(
        child: Container(
          child: InkWell(
            child: Text(locationaddress),
            onTap: () {
              _showModal(context);
            },
          ),
        ),
      ),
    );
  }

  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 600,
          child: Center(
            child: OpenStreetMapSearchAndPick(
              center: LatLong(latitude, longitude),
             
              buttonColor: Colors.blue,
              buttonText: 'Set Current Location',
              onPicked: (pickedData) {
                Navigator.pop(context);
                setState(() {
                  locationaddress = pickedData.address as String;
                  latitude = pickedData.latLong.latitude;
                  longitude = pickedData.latLong.longitude;
                });
              },
            ),
          ),
        );
      },
    );
  }
}