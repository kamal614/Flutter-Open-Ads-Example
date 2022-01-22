import 'package:flutter/material.dart';
import 'package:flutter_admob_app_open/flutter_admob_app_open.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

AppOpenAd? openAd;
Future<void> loadAd() async {
  await AppOpenAd.load(
      adUnitId: 'ca-app-pub-5709217593772841/6811839879',
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
        print("ad is loaded");
        openAd = ad;
        openAd!.show();
      }, onAdFailedToLoad: (error) {
        print("Filed to load ads $error");
      }),
      orientation: AppOpenAd.orientationPortrait);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadAd();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Open Ads Example",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Open Ads Example"),
              centerTitle: true,
            ),
            body: Center(
              child: Text("Open Ads Example"),
            )));
  }
}
