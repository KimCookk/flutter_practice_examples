import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main(List<String> args) {
  runApp(SharePlusApp());
}

class SharePlusApp extends StatelessWidget {
  const SharePlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Plus Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Share.share('앱 링크: https://yourapp.com');
          },
          child: Icon(Icons.ios_share),
        ),
      ),
    );
  }
}
