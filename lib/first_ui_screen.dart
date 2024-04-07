import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen/local_hi.dart';

enum SampleItem { iTemOne, iTemTwo, iTemThree }

class FirstUiScreen extends StatefulWidget {
  const FirstUiScreen({super.key});

  @override
  State<FirstUiScreen> createState() => _FirstUiScreenState();
}

class _FirstUiScreenState extends State<FirstUiScreen> {
  final List locale = [
    {'name': 'English', 'locale': Locale('en', 'US')},
    {'name': 'हिंदी', 'locale': Locale('hi', 'IN')},
    {'name': 'ਪੰਜਾਬੀ', 'locale': Locale('punj', 'IN')},
    {'name': 'اردو', 'locale': Locale('ur', 'IN')},
  ];

  updatelanguage(Locale locale) {}

  SampleItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade900,
          actions: [
            PopupMenuButton(
              color: Colors.white,
              initialValue: selectedMenu,
              onSelected: (SampleItem item) {
                setState(() {
                  selectedMenu = item;
                });

              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<SampleItem>>[
                PopupMenuItem(
                  value: SampleItem.iTemOne,
                  child: TextButton(
                      onPressed: () {
                        var locale = AppLocals.english;
                        Get.updateLocale(locale);
                        Navigator.pop(context);
                      },
                      child: Text(LocalStrings.english.tr)),
                ),
                PopupMenuItem<SampleItem>(
                  value: SampleItem.iTemTwo,
                  child: TextButton(
                      onPressed: () {
                        var locale = AppLocals.hindi;
                        Get.updateLocale(locale);
                        Navigator.pop(context);
                      },
                      child: Text(LocalStrings.hindi.tr)),
                ),
                PopupMenuItem<SampleItem>(
                  value: SampleItem.iTemThree,
                  child: TextButton(
                      onPressed: () {
                        var locale = AppLocals.punjabi;
                        Get.updateLocale(locale);
                        Navigator.pop(context);
                      },
                      child: Text(LocalStrings.punjabi.tr)),
                ),
                PopupMenuItem<SampleItem>(
                  value: SampleItem.iTemThree,
                  child: TextButton(
                      onPressed: () {
                        var locale = AppLocals.Urdu;
                        Get.updateLocale(locale);
                        Navigator.pop(context);
                      },
                      child: Text(LocalStrings.urdu.tr)),
                )
              ],
            )

            /*  ElevatedButton(onPressed: (){
               var locale=Locale('hi','IN');
               Get.updateLocale(locale);
             }, child: Text('button'.tr))*/
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .7,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.green.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 170,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                ),
                                Positioned(
                                    top: 8,
                                    bottom: 8,
                                    left: 8,
                                    right: 8,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 150,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          color: Colors.black,
                                          border: Border.all(
                                              color: Colors.white, width: 3)),
                                      child: Text(
                                        'hello'.tr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(height: 200),
                            Container(
                              height: 350,
                              child: Image.asset(
                                "assets/images/ink2.webp",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 30),
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width * .3,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.green[700],
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          'work'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 105,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
