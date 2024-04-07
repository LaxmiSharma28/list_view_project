import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'chattingui.dart';

class ChaTui extends StatefulWidget {
  const ChaTui({super.key});

  @override
  State<ChaTui> createState() => _ChaTuiState();
}

class _ChaTuiState extends State<ChaTui> {



  List<Map<String, String>> filter = [];
  @override
  initState() {

    filter = MainImage.imagelist;
    super.initState();
  }


  void runFilter(query) {
    List<Map<String, String>> results = [];
    if (query.isEmpty) {
      results = MainImage.imagelist;
    } else {
      results = MainImage.imagelist
          .where((filter) =>
          filter["name"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();

    }


    setState(() {
      filter = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.indigo.shade400));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/chat2.webp"))),
              child: Padding(
                padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Message",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade200,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextField(

                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color: Color(0xffA4A5B7),
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Icon(
                                Icons.search_rounded,
                                color: Color(0xff868691),
                                size: 30,
                              ),
                            ),
                          ),
                          onChanged: (value)=>
                            runFilter(value),



                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount:filter.length,
                shrinkWrap: true,

                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index)
                {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChattingUi(
                                    image: filter[index]["image"],
                                    name: filter[index]["name"],
                                  )));
                    },
                    child: SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      SizedBox(
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            filter[index]
                                                ["image"]!,
                                          ),
                                          radius: 30,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 3,
                                          right: 6,
                                          child: Container(
                                            height: 14,
                                            width: 14,
                                            decoration: BoxDecoration(
                                                color: filter[
                                                                index]
                                                            ["onlinestatus"] ==
                                                        "1"
                                                    ? Colors.green.shade600
                                                    : Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 4,
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0, left: 20, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            filter[index]["name"]!,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Color(0xff242D48),
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            filter[index]["time"]!,
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "On my way home but i needed to stop by the book store to...",
                                        maxLines: 2,
                                        style:
                                            TextStyle(color: Color(0xffA7ADBF)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class MainImage {
  static var imagelist = [
    {
      "name": "Sayad Efiaz",
      "image": "https://i.redd.it/ybfkdzoqvyu01.jpg",
      "time": "5 min",
      "onlinestatus": "0"
    },
    {
      "name": "Sanjida Aktar",
      "image":
          "https://tse1.mm.bing.net/th?id=OIP.WEkLMm8xh98bLKWHuL5EcgHaE7&pid=Api&P=0&h=180",
      "time": "15 min",
      "onlinestatus": "1"
    },
    {
      "name": "Sayad Efiaz ",
      "image":
          "https://tse2.mm.bing.net/th?id=OIP.GtvQeB1TJmjWbX4SdT0W5AHaJ4&pid=Api&P=0&h=180",
      "time": "1 hour",
      "onlinestatus": "1"
    },
    {
      "name": "Osama",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.Otr7Y1cBxTttqt2VF3gNxwHaE8&pid=Api&P=0&h=180",
      "time": "5 min",
      "onlinestatus": "0"
    },
    {
      "name": "Elone",
      "image":
          "https://i.pinimg.com/originals/2f/85/8c/2f858cdd22183b42218632545786465d.jpg",
      "time": "8 min",
      "onlinestatus": "1"
    },
    {
      "name": "elvish",
      "image":
          "http://www.goodmorningimagesdownload.com/wp-content/uploads/2021/05/Insta-Profile-Images-pictures-hd-download.gif",
      "time": "20 min",
      "onlinestatus": "1"
    },
    {
      "name": "Mahira",
      "image":
          "https://i.pinimg.com/originals/87/a9/4e/87a94e31d39d1c7e3e445efbf0c28ca8.jpg",
      "time": "25 min",
      "onlinestatus": "0"
    },
  ];
}
