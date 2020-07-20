import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

Future<List> getWilayas() async {
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

class Wilayas extends StatefulWidget {
  @override
  _Wilayas createState() => _Wilayas();
}

class _Wilayas extends State<Wilayas> {
  Future<List> futureWilayas;

  @override
  void initState() {
    super.initState();
    futureWilayas = getWilayas();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: futureWilayas,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List _data = snapshot.data;
              return ListView.builder(
                  padding: EdgeInsets.all(2.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Column(
                        children: <Widget>[
                          Text(
                            "From Highest to Lowest",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              letterSpacing: 0.5,
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            color: Colors.grey[150],
                            elevation: 9,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  //leading: _data[index]["links"]["mission_patch"] !=
                                  //        null
                                  //    ? Image.network(
                                  //        "${_data[index]["links"]["mission_patch"]}")
                                  //    : Icon(Icons.location_disabled),
                                  title: Text(_data[index]["region"]),
                                  subtitle: Text(
                                      'Infected in ${_data[index]["region"]} : ${_data[index]["value"]}'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        color: Colors.grey[150],
                        elevation: 9,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              //leading: _data[index]["links"]["mission_patch"] !=
                              //        null
                              //    ? Image.network(
                              //        "${_data[index]["links"]["mission_patch"]}")
                              //    : Icon(Icons.location_disabled),
                              title: Text(_data[index]["region"]),
                              subtitle: Text(
                                  'Infected in ${_data[index]["region"]} : ${_data[index]["value"]}'),
                            ),
                          ],
                        ),
                      );
                    }
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
