import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: buildHomePage('Just hotel in Ams'),
    );
  }

  Widget buildHomePage(String title) {
    final titleText = Container(
      padding: EdgeInsets.all(20),
      child: Text(
        'Just hotel in Ams',
        style: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

    var photos = Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Expanded(
        child: Padding(
            padding: EdgeInsets.all(2),
            child: Image.asset('images/photo1.webp')),
      ),
      Expanded(
          child: Padding(
        padding: EdgeInsets.all(2),
        child: Image.asset('images/photo2.webp'),
      )),
      Expanded(
          child: Padding(
        padding: EdgeInsets.all(2),
        child: Image.asset('images/photo3.webp'),
      ))
    ]);

    final mainImage = Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Image.asset(
          'images/hotel_ams.webp',
          height: 250,
          fit: BoxFit.fill,
        ));

    final subTitle = Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
          'The best hotel in center. Great view, tasty breakfast, comfy rooms',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white60,
            fontFamily: 'Georgia',
            fontSize: 20,
          )),
    );

    final subLocation = GestureDetector(
        onTap: () => {print("tada")},
        child: Container(
          padding: EdgeInsets.only(left: 0, bottom: 5),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(
              Icons.location_on,
              color: Colors.pink,
              size: 30.0,
            ),
            Text('Sarphatistraat 104, Amsterdam',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Georgia', fontSize: 18, color: Colors.white60))
          ]),
        ));

    Widget _buildList() => ListView(
          padding: const EdgeInsets.all(12),
          children: [mainImage, subTitle, subLocation, photos],
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      // #docregion body
      body: Center(
        child: Container(
          color: Colors.black87,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Center(child: _buildList()),
        ),
      ),
      // #enddocregion body
    );
  }
}

class SimpleMap extends StatefulWidget {
  @override
  _SimpleMapState createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _kInitialPosition,
    );
  }
}
