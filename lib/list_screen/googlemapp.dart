import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FullScreen extends StatefulWidget {
  const FullScreen({super.key});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  List Images = [
    "https://i.redd.it/ybfkdzoqvyu01.jpg",
    "https://i.pinimg.com/originals/16/4f/4e/164f4e02871a8cf607b7b147624078ca.jpg",
    "https://smuzthemes.com/wp-content/uploads/2019/02/insta-1.jpg"
  ];

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(30.67995, 76.72211), zoom: 14);

  Set<Marker> markers = {};

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }

  Position? position;

//Direct current Location
  Future<Position> getCurrentLocation() async {
    try {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      log('Location: ${position!.latitude}, ${position!.longitude}');
    } catch (e) {
      print('Error determining position: $e');
    }
    return position!;
  }

  @override
  void initState() {
    _determinePosition();
    // getCurrentLocation();
    super.initState();
    // markers.add(Marker(
    //   markerId: MarkerId('Current Location'),
    //   position: LatLng(position!.longitude, position!.latitude),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    getCurrentLocation();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 487,
              color: Colors.orange,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 30,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.apps,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: SizedBox(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2.1,
                            child: SizedBox(
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "08",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                    Text(
                                      "June",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    SizedBox(height: 50),
                                    Text(
                                      "Surakarta Clean City Together",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 90),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Surakarta, INA",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: SizedBox(
                          child: Container(
                              height: MediaQuery.of(context).size.height / 2.2,
                              child: Image(
                                image: AssetImage("assets/images/newimg2.png"),
                                height: 340,
                                width: 200,
                              )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: 550,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 13, top: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          for (int i = 0; i < Images.length; i++)
                            Align(
                              widthFactor: 0.6,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.orange,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(Images[i]),
                                ),
                              ),
                            ),
                          SizedBox(width: 22),
                          Text(
                            "George & 40 friends join this event",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        children: [
                          Text(
                            "Hi Surakartas! We wait you to join with us.We need you to save our city  stay clean & beautiful.Let's join Surakartas! Details",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        height: 150,
                        child: GoogleMap(
                          myLocationEnabled: true,
                          mapType: MapType.normal,
                          zoomGesturesEnabled: false,
                          initialCameraPosition: initialCameraPosition,
                          markers: markers,
                          onMapCreated: (GoogleMapController controller) async {
                            await getCurrentLocation();
                            await controller.animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                                    target: LatLng(
                                      position!.latitude,
                                      position!.longitude,
                                    ),
                                    zoom: 14)));

                            _controller.complete(controller);
                            setState(() {
                              getCurrentLocation();
                              markers.add(Marker(
                                markerId: const MarkerId('Current Location'),
                                position: LatLng(
                                    position!.latitude, position!.longitude),
                              ));
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.orange, width: 1)),
                              child: Icon(
                                Icons.turned_in_not,
                                color: Colors.black87,
                              ),
                            ),
                            Container(
                                height: 60,
                                width: 300,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Join Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
