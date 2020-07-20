import 'dart:collection';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future<List> getMapWilayas() async {
  String apiURL =
      "https://api.apify.com/v2/key-value-stores/pp4Wo2slUJ78ZnaAi/records/LATEST?disableRedirect=true";
  http.Response response = await http.get(apiURL);
  var entireData = json.decode(response.body);
  if (response.statusCode == 200) {
    return entireData["infectedByRegion"];
  } else {
    throw ("Could not fetch launches");
  }
}

class Map extends StatefulWidget {
  @override
  _Map createState() => _Map();
}

class _Map extends State<Map> {
  Future<List> futureWilaya;

  @override
  void initState() {
    super.initState();
    futureWilaya = getMapWilayas();
  }

  Completer<GoogleMapController> _controller = Completer();

  Set<Circle> _circles = HashSet<Circle>();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.0, 2.0),
    zoom: 5.0,
  );

  void _setMapStyle(GoogleMapController controller) async {
    String style =
        await DefaultAssetBundle.of(context).loadString('assets/mapStyle.json');
    controller.setMapStyle(style);
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);

    setState(() {});
    _setMapStyle(controller);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
          future: futureWilaya,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var listtruc = [
                {"LAT": 36.74053, "LON": 3.00957},
                {"LAT": 36.16667, "LON": 5.5},
                {"LAT": 36.58333, "LON": 3.0},
                {"LAT": 35.66667, "LON": -0.5},
                {"LAT": 36.33333, "LON": 6.66667},
                {"LAT": 35.5, "LON": 5.91667},
                {"LAT": 30.5, "LON": 6.16667},
                {"LAT": 36.58333, "LON": 2.41667},
                {"LAT": 34.66667, "LON": 5.41667},
                {"LAT": 36.66667, "LON": 4.91667},
                {"LAT": 34.33333, "LON": 3.66667},
                {"LAT": 34.66667, "LON": -1.41667},
                {"LAT": 34.91667, "LON": 1.58333},
                {"LAT": 33.16667, "LON": 7.25},
                {"LAT": 36.75, "LON": 4.25},
                {"LAT": 36.16667, "LON": 2.16667},
                {"LAT": 35.0, "LON": 7.0},
                {"LAT": 35.33333, "LON": 4.33333},
                {"LAT": 36.25, "LON": 3.91667},
                {"LAT": 33.58333, "LON": 2.66667},
                {"LAT": 36.75, "LON": 3.66667},
                {"LAT": 36.08333, "LON": 3.0},
                {"LAT": 35.83333, "LON": 7.08333},
                {"LAT": 35.0, "LON": 7.83333},
                {"LAT": 36.83333, "LON": 7.58333},
                {"LAT": 36.08333, "LON": 4.75},
                {"LAT": 31.08333, "LON": 3.16667},
                {"LAT": 35.41667, "LON": 0.16667},
                {"LAT": 25.75, "LON": -1.0},
                {"LAT": 36.75, "LON": 6.83333},
                {"LAT": 35.75, "LON": 1.75},
                {"LAT": 36.41667, "LON": 6.16667},
                {"LAT": 36.0, "LON": 0.33333},
                {"LAT": 30.25, "LON": -3.08333},
                {"LAT": 36.41667, "LON": 7.41667},
                {"LAT": 34.83333, "LON": -0.5},
                {"LAT": 35.33333, "LON": -1.08333},
                {"LAT": 36.16667, "LON": 7.91667},
                {"LAT": 36.75, "LON": 6.0},
                {"LAT": 32.5, "LON": 1.16667},
                {"LAT": 33.5, "LON": -0.83333},
                {"LAT": 35.75, "LON": 0.91667},
                {"LAT": 23.75, "LON": 4.66667},
                {"LAT": 36.25, "LON": 1.25},
                {"LAT": 36.75, "LON": 8.16667},
                {"LAT": 26.83333, "LON": 8.16667},
                {"LAT": 34.66667, "LON": 0.33333},
                {"LAT": 27.41667, "LON": -5.83333},
              ];

              int count = 0;
              snapshot.data.forEach((element) {
                _circles.add(Circle(
                  circleId: CircleId(element["region"]),
                  center:
                      LatLng(listtruc[count]["LAT"], listtruc[count]["LON"]),
                  //infoWindow: InfoWindow(
                  //    title: element["region"],
                  //    snippet: "Infected : ${element["value"]}"
                  radius: element["value"] * 50.23,
                  fillColor: Colors.redAccent.withOpacity(0.5),
                  strokeWidth: 1,
                  strokeColor: Colors.red,
                  onTap: () => print("mdr"),
                ));
                count++;
              });
              return GoogleMap(
                initialCameraPosition: _kGooglePlex,
                onMapCreated: _onMapCreated,
                circles: _circles,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),*/
    );
  }
}
