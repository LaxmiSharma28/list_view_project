import 'package:flutter/material.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {

  TextEditingController nameController = TextEditingController();
  List<String> textList = [];

  List<String> filterList = [];



  void runFilter(query) {
    List<String> results = [];
    if (query.isEmpty) {
      results = filterList;
    } else {
      results = filterList
          .where((filter) => filter.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      filterList = results;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          if (nameController.text.isEmpty) {
                            return;
                          }
                          filterList.add(nameController.text);
                          filterList.sort();
                          nameController.clear();
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepOrange,
                        ),
                        height: 60,
                        width: 120,
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35),
                      height: 60,
                      width: 220,
                      child: TextField(
                        onChanged: (value) => runFilter(value),
                        decoration: const InputDecoration(
                            labelText: 'Search',
                            suffixIcon: Icon(Icons.search)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: MediaQuery.of(context).size.height,
                    child: Expanded(
                      child: ListView.builder(
                          itemCount: filterList.length,
                          itemBuilder: (context, index) => Card(
                            color: Colors.deepOrangeAccent,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: ListTile(
                                        title: Text(filterList[index]),
                                        onLongPress: () {
                                          setState(() {
                                            filterList.removeAt(index);

                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
