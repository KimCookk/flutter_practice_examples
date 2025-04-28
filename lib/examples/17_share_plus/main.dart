import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Share.share('앱 링크: https://yourapp.com');
              },
              child: Icon(Icons.ios_share),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final link = await fetchAppDownloadLink();
                  if (link.isNotEmpty) {
                    print('앱 링크 : $link');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('❗ 링크를 가져오지 못했습니다')),
                    );
                  }
                } catch (e) {
                  print('에러 발생 : $e');
                }
              },
              child: Text('Print Download Link'),
            )
          ],
        ),
      ),
    );
  }

  Future<String> fetchAppDownloadLink() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    return remoteConfig.getString('app_download_link');
  }
}
