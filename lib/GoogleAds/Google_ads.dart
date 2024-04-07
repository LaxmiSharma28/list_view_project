import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAds extends StatefulWidget {
  const GoogleAds({super.key});

  @override
  State<StatefulWidget> createState() => _GoogleAdsState();
}

State<GoogleAds> createState() => _GoogleAdsState();

class _GoogleAdsState extends State<GoogleAds> {



  final String adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  @override
  void initState() {
    super.initState();

    initBannerAd();
  }



  late BannerAd bannerAd;
  bool isAdLoaded = false;

  initBannerAd() {
    bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: adUnitId,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            isAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print(error);
        }),
        request: AdRequest());

    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Google Ads"),
          backgroundColor: Colors.purple,
        ),
        body: Stack(
          children: [
            if (bannerAd != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: SizedBox(
                    width: bannerAd .size.width.toDouble(),
                    height: bannerAd.size.height.toDouble(),
                    child: AdWidget(ad: bannerAd),
                  ),
                ),
              )
          ],
        ));
  }

}
