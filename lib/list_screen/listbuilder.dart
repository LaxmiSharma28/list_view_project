import 'package:flutter/material.dart';

class ListViewBuilderUi extends StatefulWidget {
  const ListViewBuilderUi({super.key});

  @override
  State<ListViewBuilderUi> createState() => _ListViewBuilderUiState();
}

class _ListViewBuilderUiState extends State<ListViewBuilderUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView Builder"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          height: 300,
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.deepPurpleAccent,
                  width: 400,
                  child: Image.asset("assets/images/avtaar.webp"),
                ),
              );
            },
          ),
        ));
  }
}
