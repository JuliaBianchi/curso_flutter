import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocalizationCardComponent extends StatefulWidget {
  LocalizationCardComponent({super.key});

  @override
  State<LocalizationCardComponent> createState() =>
      _LocalizationCardComponentState();
}

class _LocalizationCardComponentState extends State<LocalizationCardComponent> {
   String latitude = '';

   String longitude = '';

  String locationMessage = 'Localização atual do usuário.';

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('A localização está desativada.');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Permissão de acesso a localização negada.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Permissão de acesso negada para sempre.');
    }

    return await Geolocator.getCurrentPosition();
  }

  // listen to location updates
  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();

      log(latitude);
      log(longitude);

      setState(() {
        locationMessage = 'Latitude: $latitude \n Longitude: $longitude';
      });
    });
  }

  Future<void> _openMaps(String latitude, String longitude) async {
    String googleUrl = "https://google.com/maps/search/?api=1&query=${latitude},${longitude}";

    await launchUrl(Uri.parse(googleUrl))
        ? await launchUrl((Uri.parse(googleUrl)))
        : showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Text('$googleUrl \n', textAlign: TextAlign.center),
              title: Text('Ops, não foi possível carregar a url.', textAlign: TextAlign.center),
              actions: [
                Center(
                  child: ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Fechar',
                      style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ));

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375,
      width: 350,
      child: Card(
        elevation: 10,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: Text(locationMessage),
              ),
              ElevatedButton(
                onPressed: () {
                  _getCurrentLocation().then((value) {
                    latitude = '${value.latitude}';
                    longitude = '${value.longitude}';

                    setState(() {
                      locationMessage =
                          'Latitude: $latitude \n Longitude: $longitude';
                    });

                    _liveLocation();
                  });
                },
                child: const Text("Obter localização."),
              ),
              ElevatedButton(
                onPressed: () {
                  _openMaps(latitude, longitude);
                },
                child: const Text('Abrir no google maps.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
