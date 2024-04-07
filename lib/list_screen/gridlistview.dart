import 'package:flutter/material.dart';

class ListViewUi extends StatefulWidget {
  const ListViewUi({super.key});

  @override
  State<ListViewUi> createState() => _ListViewUiState();



}

class _ListViewUiState extends State<ListViewUi> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridList View"),
        backgroundColor: Colors.blue,
      ),
              body: GridView.count(
                crossAxisCount: 1,
                shrinkWrap: true,
                children: List.generate(5, (index){
                  return Padding(padding: EdgeInsets.all(15),
                  child: Container(decoration: BoxDecoration(
                    color: Colors.pink.shade200,
                    borderRadius: BorderRadius.circular(20)

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(


                        children: [Row
                          (mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                        Text("NAME:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                        Text("Laxmi Sharma",style: TextStyle(fontSize: 20,color: Colors.white),)

                      ],),
                        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                            Text("ID:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Text("Laxmii405656",style: TextStyle(fontSize: 20,color: Colors.white),)


                            
                          ],),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text("DESIGNATION:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("Traniee",style: TextStyle(fontSize: 20,color: Colors.white),)

                            ],),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text("CONTECT:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("12346789",style: TextStyle(fontSize: 20,color: Colors.white),)

                            ],),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text("EMAIL:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("laxmi11@gmail",style: TextStyle(fontSize: 20,color: Colors.white),)

                            ],),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text("DOB:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("28-10-1995",style: TextStyle(fontSize: 20,color: Colors.white),)

                            ],),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text("STATUS:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("Unmarried",style: TextStyle(fontSize: 20,color: Colors.white),)

                            ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text("ADDRESS:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("Balongi,Mohali",style: TextStyle(fontSize: 20,color: Colors.white),)

                            ],),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Text("PIN CODE:",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              Text("110065",style: TextStyle(fontSize: 20,color: Colors.white),)

                            ],),

                        ],),
                    ),
                  ),


                  );
                },
                ),
                ),





    );
  }
}
