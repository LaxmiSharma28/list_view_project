import 'package:flutter/material.dart';

class ListDemo extends StatefulWidget {
  const ListDemo({super.key});

  @override
  State<ListDemo> createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController name = TextEditingController();

  List<Map<String, String>> item = [];

  List<Map<String, String>> filter = [];

  addName(name) {
    if (nameController.text.trim().isEmpty) {
      return;
    }
    item.add({"title": name.toString()});
    filter.add({"title": name.toString()});

  }



  handleSearch(searchText) {
    item = filter
        .where((element) => element['title']!.toLowerCase().contains(searchText.toString().toLowerCase()))
        .toList();
    setState(() {});
    if(name.text.isEmpty){
      return;

    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    addName(nameController.text);
                    nameController.clear();
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
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 35),
                  height: 60,
                  width: 150,
                  child: TextField(
                    controller: name,
                    onChanged: (value) {
                      handleSearch(value);
                    },
                    decoration: const InputDecoration(labelText: 'Search', suffixIcon: Icon(Icons.search)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: item.isEmpty
                    ? const Text("No data match")
                    : ListView.builder(
                    itemCount: item.length,
                    itemBuilder: (context, index) => Card(
                      key: ValueKey(item[index]),
                      color: Colors.deepOrangeAccent,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: ListTile(
                              title: Text(item[index]['title'] ?? ""),
                              onLongPress: () {
                                setState(() {
                                  item.removeAt(index);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
