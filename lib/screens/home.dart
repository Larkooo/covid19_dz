import 'package:flutter/material.dart';
import 'package:covid19_dz/api.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  Future<ApiGlobal> futureApiGlobal;

  @override
  void initState() {
    super.initState();
    futureApiGlobal = fetchApiGlobal();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder<ApiGlobal>(
        future: futureApiGlobal,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Algeria Covid-19 Statistics",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    letterSpacing: 3,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 105,
                    width: 300,
                    //padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 40,
                              color: Colors.grey[500])
                        ]),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(snapshot.data.infected.toString(),
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  letterSpacing: 1,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Infected",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      letterSpacing: 1,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.sentiment_dissatisfied)
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 105,
                    width: 300,
                    //padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 40,
                              color: Colors.grey[500])
                        ]),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Icon(
                                  Icons.local_hospital,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  snapshot.data.hospital.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Column(
                              children: <Widget>[
                                Icon(
                                  Icons.healing,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  snapshot.data.recovered.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Column(
                              children: <Widget>[
                                Icon(Icons.sentiment_very_dissatisfied),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  snapshot.data.deceased.toString(),
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                Container(
                  color: Colors.grey[900],
                  height: 252,
                  width: 500,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 125,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 40,
                                    color: Colors.grey[850])
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Last Updated",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Text(
                                "Source",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.3,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data.lastUpdatedSource,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 9,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          height: 125,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 40,
                                    color: Colors.grey[850])
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Last Updated",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Text(
                                "API",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0.3,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data.lastUpdatedApi,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 9,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("Error");
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}
