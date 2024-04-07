import 'package:flutter/material.dart';

import '../PostModel.dart';

class Task2Ui extends StatefulWidget {
  const Task2Ui({super.key});

  @override
  State<Task2Ui> createState() => _Task2UiState();
}

class _Task2UiState extends State<Task2Ui> {
  List<String> postImagesList = [
    "https://res.cloudinary.com/demo/image/upload/v1312461204/sample.jpg",
    "http://wonderfulengineering.com/wp-content/uploads/2014/01/beautiful-wallpaper-39.jpg",
    "http://clipart-library.com/images_k/peacock-transparent/peacock-transparent-10.png"
  ];
  List<String> mainImageList = [
    "https://pluspng.com/img-png/png-images--800.png",
    "",
    "",
  ];

  List<PostModel> postModelList = [
    PostModel(imagesList: [
      "https://res.cloudinary.com/demo/image/upload/v1312461204/sample.jpg",
      "https://pluspng.com/img-png/png-images--800.png",
      "http://clipart-library.com/images_k/peacock-transparent/peacock-transparent-10.png"
    ]),
    PostModel(imagesList: [
      "https://pluspng.com/img-png/png-images--800.png",
      "http://wonderfulengineering.com/wp-content/uploads/2014/01/beautiful-wallpaper-39.jpg",
      "https://w7.pngwing.com/pngs/915/345/png-transparent-multicolored-balloons-illustration-balloon-balloon-free-balloons-easter-egg-desktop-wallpaper-party-thumbnail.png"
    ]),

    PostModel(imagesList: [
      "http://clipart-library.com/images/5TRKaGjpc.png",
      "http://wonderfulengineering.com/wp-content/uploads/2014/01/beautiful-wallpaper-39.jpg",
      "http://clipart-library.com/images_k/peacock-transparent/peacock-transparent-10.png"
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Text(
          "Instagram",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.favorite,
            color: Colors.red,
            size: 30,
          ),
          SizedBox(width: 20),
          Icon(
            Icons.message,
            color: Colors.white,
            size: 25,
          ),
        ],
        backgroundColor: Colors.black,
      )),
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 130,
                child: ListView.builder(

                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.purple,
                            child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/i.jpg'),
                              radius: 55,
                          ),),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor:Colors.blue,
                            child:CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/i2.jpg'),
                              radius: 55,

                          ),),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor:Colors.red,
                            child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/i3.jpg'),
                      radius: 55,

                      ),
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor:Colors.yellow,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/i4.png'),
                      radius: 55,

                      ),
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor:Colors.orange,
                      child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/i5.jpg'),
                      radius: 55,

                      ),
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor:Colors.green,
                            child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/i6.jpg'),
                                radius: 55,

                      ),
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor:Colors.brown,
                      child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/i4.png'),
                      radius: 55,

                      ),
                          ),

                          CircleAvatar(
                            radius: 50,
                            backgroundColor:Colors.blue,
                            child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/avtaar1.png'),
                      radius: 55,

                      ),
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor:Colors.blue,
                      child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/whats.png'),
                      radius: 55,

                      ),
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor:Colors.blue,
                            child: CircleAvatar(
                            backgroundImage:

                                AssetImage('assets/images/av.png'),
                                radius: 55,),

                      ),

                        ],
                      ),
                    );
                  },
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: postModelList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, index) {
                    return SizedBox(
                      height: 550,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: postModelList[index].imagesList.length,
                          itemBuilder: (BuildContext context, index2) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 450,
                                    width: 410,
                                    color: Colors.white,
                                    child: Image.network(
                                      postModelList[index].imagesList[index2],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(height: 30,
                                      child: Row(
                                        children: [
                                          Icon(Icons.favorite,color: Colors.red,size: 30,),
                                          SizedBox(width: 8),
                                          Icon(Icons.messenger_outline,color: Colors.white,size: 30,),
                                          SizedBox(width: 8),
                                          Icon(Icons.send,color: Colors.white,size: 30,),
                                        ],
                                      ),



                                    ),

                                  )
                                ],
                              ),

                            );
                          }

                          ),

                    );

                  },


                  ),

            ],
          ),
        ),
      ),
    );
  }
}
