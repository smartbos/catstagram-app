import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catstagram',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var catImg;
  var nextCatImg;

  _MyHomePageState() {
    catImg = 'https://pbs.twimg.com/media/ByA3wtYIIAAOwaK.jpg';
    nextCatImg = 'https://static01.nyt.com/images/2019/09/04/business/04chinaclone-01/merlin_160087014_de761d9a-4360-402d-a15b-ddeff775760d-articleLarge.jpg?quality=75&auto=webp&disable=upscale';
  }

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: nextCatImg,
            ),
          ),
          BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              )),
          GestureDetector(
            onHorizontalDragEnd: (e) {
              setState(() {
                catImg = nextCatImg;
                nextCatImg = 'https://specials-images.forbesimg.com/imageserve/5de6f2d8c283810006a3947f/960x0.jpg?fit=scale';
              });
            },
            child: Center(
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: catImg,
              ),
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: Text('Save'),
        icon: Icon(Icons.favorite),
        backgroundColor: Colors.pink,
      ),
    ));
  }
}
