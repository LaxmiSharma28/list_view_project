import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CallApi extends StatefulWidget {
  const CallApi({Key? key}) : super(key: key);

  @override
  State<CallApi> createState() => _CallApiState();
}

class _CallApiState extends State<CallApi> {

  List<dynamic> data = [];

  final uri = "https://jsonplaceholder.typicode.com/posts";

  void postdata()async{
    final responce = await post(Uri.parse(uri),body:{
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
    apidata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: postdata, child: Text('send data'),),
        )
    );
  }
  void apidata()async{
    final responce = await get(Uri.parse(uri));
    final jsondata = jsonDecode(responce.body) as List;
    setState(() {
      data = jsondata;
    });
  }
}