import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:screen/list_array_modal/task.dart';
import 'package:screen/list_demo.dart';
import 'package:screen/list_screen/image_picker.dart';
import 'package:screen/list_screen/prectice.dart';
import 'package:screen/local_hi.dart';
import 'Api/Login_Post_Api/login_api_screen.dart';
import 'Sign_up_screen/bottomnavigation.dart';
import 'Sign_up_screen/btmnaviprofile.dart';
import 'image picker/image_picker_grid.dart';
import 'image picker/imagepicker.dart';
import 'list_screen/chatscreenui.dart';
import 'list_screen/chattingui.dart';
import 'list_screen/gridlistview.dart';
import 'list_screen/instagram.dart';
import 'list_screen/instaui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();

  RequestConfiguration requestConfiguration = RequestConfiguration();
  MobileAds.instance.updateRequestConfiguration(requestConfiguration);



  runApp(const MyApp());
  FirebaseMessaging.instance.getToken().then((value) {
    String? token = value;
    print("login Token=======>>>>>$token");
  }
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );





  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Local(),
      locale: Locale('en', 'IN'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: InStaGramUi(),
    );
  }
}
