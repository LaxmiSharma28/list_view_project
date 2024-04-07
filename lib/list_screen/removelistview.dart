import 'package:flutter/material.dart';

class RemoveListUi extends StatefulWidget {
  const RemoveListUi({super.key});

  @override
  State<RemoveListUi> createState() => _RemoveListUiState();
}

class _RemoveListUiState extends State<RemoveListUi> {

  List myList =[1,2,3,4,5,6,7,8,9];

  void main(){

    myList.removeAt(5);
    print(myList);
  }

@override
void initState() {
    main();
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Removelist"),
        backgroundColor: Colors.pinkAccent,
      ),



    );
  }
}

