import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:screen/Api/Delete_Modal.dart';

class DeleteExampleApi extends StatefulWidget {
  const DeleteExampleApi({Key? key}) : super(key: key);

  @override
  State<DeleteExampleApi> createState() => _DeleteExampleApiState();
}

class _DeleteExampleApiState extends State<DeleteExampleApi> {

  List<dynamic> data = [];
  DeleteModal modal =DeleteModal();




  void postdata() async {
    final responce = await post(
        Uri.parse("https://jsonplaceholder.typicode.com/post"),
        body: {
          "title": "Anything",
          "body": "Post body",
          "userid": "1",
        });
    print(responce.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ListTile(
                            title: Text("Title"),
                            subtitle: Text(data.toString()),
                          ),

                      ListTile(
                        title: Text("Body"),
                        subtitle: Text(data.toString()),
                      ),
                      ListTile(
                        title: Text("User ID"),
                        subtitle: Text("${data.toString()}"),
                      ),
                      ])
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  void apidata()async{
    final responce = await delete(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
    print(responce);
    final jsondata = jsonDecode(responce.body) as List;
    setState(() {
      print(jsondata);
      data = jsondata;
    });
  }
  void getdata()async{
    final responce = await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
 if(responce.statusCode==200){
   var jsondata=jsonDecode(responce.body) ;
   modal=DeleteModal.fromJson(jsondata);
   setState(() {
       
   });
 }else{
   throw Exception("Error");
 }
  }
}

