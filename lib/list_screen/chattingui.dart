import 'package:flutter/material.dart';

class ChattingUi extends StatefulWidget {
  ChattingUi({Key? key, this.image, this.name})
      : super(
          key: key,
        );
  String? image;
  String? name;

  @override
  State<ChattingUi> createState() => _ChattingUiState();
}

class _ChattingUiState extends State<ChattingUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              child: Column(
                children: [
                  Container(
                    height: 110,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 25),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Padding(
                          padding: const EdgeInsets.only(top: 28),
                          child: CircleAvatar(
                            radius: 25,
                            // backgroundImage: NetworkImage(widget.image!),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 45, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "hghgfvgu",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "typing....",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Today",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(5)),
                      color: Colors.lightBlueAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Got a big plan,this Mindset maybe it's right...At the right place and right time,maybe tonight.....",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 10),
                      child: Text(
                        "And the whisper or handshake sending  a sign...",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                    ),
                    child: Image.network(
                      "https://www.sketchappsources.com/resources/source-image/telegram-voice-message.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                            bottomLeft: Radius.circular(5))),
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Late night, and passing,mention it flipped her. Best Friend, who knows saying maybe it slipped...",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(5)),
                      color: Colors.lightBlueAccent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "And the whisper or handshake sending  a sign...",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade100),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 7, left: 10, bottom: 7, right: 10),
                    child: TextField(

                      //textAlignVertical: TextAlignVertical(y: -0.6),
                      decoration: InputDecoration(
                        // isDense: true,
                        contentPadding: EdgeInsets.only(top: 8),
                        border: InputBorder.none,
                        hintText: "Message....",
                        hintStyle: TextStyle(color: Colors.grey,),
                        prefixIcon: Icon(
                          Icons.add_circle_outlined,
                          color: Colors.blue,
                          size: 35,
                        ),
                        suffixIcon: Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
