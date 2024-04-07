import 'package:flutter/material.dart';

class TaskUi extends StatefulWidget {
  const TaskUi({super.key});

  @override
  State<TaskUi> createState() => _TaskUiState();
}

class _TaskUiState extends State<TaskUi> {
  List<Data> datas = [];

  @override
  void initState() {
    datas.add(Data(
        id: "1",
        name: "Laxmi",
        email: "Laxmi405656@gmail.com",
        phone: "12345678"));
    datas.add(Data(
        id: "2",
        name: "Subhpreet",
        email: "Subh@gmail.com",
        phone: "789456146"));
    datas.add(Data(
        id: "3",
        name: "Rajwinder",
        email: "Rajwinder@gmail.com",
        phone: "458566988"));
    datas.add(Data(
        id: "4",
        name: "Nishu",
        email: "Nishu405656@gmail.com",
        phone: "854136696"));

    super.initState();
  }

  bool check= false;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: datas.map((data) {
                return Container(
                  child: Card(
                      child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [Checkbox
                            (value: check, onChanged: (val){
                            setState(() {
                              check=val!;
                            });

                          }),
                            ElevatedButton(

                              style:ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                padding: EdgeInsets.only(left: 10,bottom: 14)
                              ),

                              onPressed: ()
                              {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Alert Dialog Box"),
                                    content: Text(
                                        "You have raised a Alert Dialog Box"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {

                                            datas.removeWhere((element) {
                                              return element.id == data.id;
                                            });

                                            setState(() {
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text("Yes")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },

                                          child: Text("No")),
                                    ],
                                  ),
                                );
                              },
                              child: Icon(Icons.delete),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Name:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(data.name.toString())
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Email:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(data.email.toString())
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Phone:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(data.phone.toString())
                          ],
                        ),
                      ],
                    ),
                  )),
                );
              }).toList(),
            ),
          ),
        ));
  }
}

class Data {
  String id, name, email, phone;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });
}
