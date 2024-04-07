import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class InstaDemo extends StatefulWidget {
  const InstaDemo({super.key});

  @override
  State<InstaDemo> createState() => _InstaDemoState();
}

class _InstaDemoState extends State<InstaDemo> {
  List<String> postImage = [
    "https://i.pinimg.com/originals/74/09/af/7409af350323c6f8b16c94e3366ef698.jpg",
    "https://i.pinimg.com/originals/16/4f/4e/164f4e02871a8cf607b7b147624078ca.jpg",
    "https://i.pinimg.com/originals/a3/e3/41/a3e341ffd4f276d7fa090a60822f0083.jpg",
  ];

  List<String> storyImage = [
    "https://i.pinimg.com/736x/ef/07/8b/ef078b1548baa781bb3d3e642d3542d2.jpg",
    "https://tse2.mm.bing.net/th?id=OIP.zhJbKHs111OmT30PYbx-owHaLH&pid=Api&P=0&h=180",
    "https://i.pinimg.com/originals/d4/86/0e/d4860ec6ae0712170dbdacc74b5bb30e.jpg"
  ];

  List<PostModel> postModelList = [
    PostModel(imageList: [
      "https://i.redd.it/ybfkdzoqvyu01.jpg",
      "https://tse2.explicit.bing.net/th?id=OIP.dI-13tUpVnQXPoM7OcnchwHaJM&pid=Api&P=0&h=180",
      "https://tse1.mm.bing.net/th?id=OIF.eoG3GuRJATCkCAardIPf4w&pid=Api&P=0&h=180"
    ],),
    PostModel(imageList: [
      "https://i0.wp.com/wlgurgora.com/wp-content/uploads/2023/07/%EB%89%B4%EC%A7%84%EC%8A%A4%EC%8D%B8%EB%84%A4%EC%9D%BC.png",
      "https://tse1.mm.bing.net/th?id=OIF.rlsrbd1YrIuAWZoTy043uw&pid=Api&P=0&h=180",
      "https://i.pinimg.com/originals/8a/86/d5/8a86d58c28ee9691a6d86ac2c2d0341d.jpg"
    ],),
    PostModel(imageList: [
      "https://i.pinimg.com/736x/26/c4/bb/26c4bb1b0252de8d9821030df3e5ead6.jpg",
      "https://media.licdn.com/dms/image/D4E05AQHApkeQJa_oUw/videocover-high/0/1689689287348?e=2147483647&v=beta&t=t_-h2q45q5Rfu2HoHTyMJeA-Zw_oIrR_cFmI3AHnvFU",
      "https://smuzthemes.com/wp-content/uploads/2019/02/insta-1.jpg"
    ])
  ];






  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Instagram",
            style: TextStyle(
                color: Colors.white, fontFamily: "Satisfy", fontSize: 30)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bolt,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, color: Colors.black, size: 30),
          Icon(Icons.search, color: Colors.black, size: 30),
          Icon(Icons.add_box_outlined, color: Colors.black, size: 30),
          Icon(Icons.video_library, color: Colors.black, size: 30),
          Icon(Icons.perm_identity, color: Colors.black, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: MainImage.user.length,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: (Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: const LinearGradient(colors: [
                                    Colors.yellowAccent,
                                    Colors.pink,
                                    Colors.red,
                                    Colors.deepOrange,
                                    Colors.pink,
                                    Colors.purple
                                  ]),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(3),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        MainImage.user[index]["image"]!),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                child: Center(
                                  child: Text(
                                    MainImage.user[index]["name"]!,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontFamily: "Lobster"),
                                  ),
                                ),
                              )
                            ],
                          )),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
                child: Column(
              children: [
                ListView.builder(
                  itemCount: postImage.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return (SizedBox(
                      height: 650,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: postModelList[index].imageList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index2) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                  "",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: "Lobster"),
                                  ),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  Icon(
                                    Icons.more_horiz,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              (Container(
                                height: 500,
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(
                                    postModelList[index].imageList[index2],
                                    fit: BoxFit.cover),
                              )),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.circle_notifications,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.send,
                                      color: Colors.white,
                                      size: 30,
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ));
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class MainImage {
  static const user = [
    {
      "name": "Add Status",
      "image":
          "https://tse2.mm.bing.net/th?id=OIP.5UrEO_EvMScTaxOZ-1SflAHaE8&pid=Api&P=0&h=180"
    },
    {
      "name": "Sweety",
      "image":
          "https://tse1.mm.bing.net/th?id=OIP.WEkLMm8xh98bLKWHuL5EcgHaE7&pid=Api&P=0&h=180"
    },
    {
      "name": "Angel",
      "image":
          "https://tse2.mm.bing.net/th?id=OIP.GtvQeB1TJmjWbX4SdT0W5AHaJ4&pid=Api&P=0&h=180"
    },
    {
      "name": "Osama",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.Otr7Y1cBxTttqt2VF3gNxwHaE8&pid=Api&P=0&h=180"
    },
    {
      "name": "Elone",
      "image":
          "https://i.pinimg.com/originals/2f/85/8c/2f858cdd22183b42218632545786465d.jpg"
    },
    {
      "name": "elvish",
      "image":
          "http://www.goodmorningimagesdownload.com/wp-content/uploads/2021/05/Insta-Profile-Images-pictures-hd-download.gif"
    },
    {
      "name": "Bigg boss",
      "image":
          "https://i.pinimg.com/originals/87/a9/4e/87a94e31d39d1c7e3e445efbf0c28ca8.jpg"
    },
  ];
}

class PostModel {
  //need

  List<String> imageList;

  PostModel({

    required this.imageList,
  });
}




