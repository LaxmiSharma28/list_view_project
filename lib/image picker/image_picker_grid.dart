import 'package:flutter/material.dart';

class ImageGrid extends StatefulWidget {
  const ImageGrid({super.key});

  @override
  State<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home "),
          centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.arrow_forward),onPressed: (){},)],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 1.3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 20,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber.shade200, borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black54,width: 1)
                ),
                child: Text("Upload Pic"),
              );
            }),


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){}
        ,
        backgroundColor: Colors.orange,
        // shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero,),
        child: Icon(Icons.add,size: 30,color: Colors.white,),
      ),
    );
  }
}
