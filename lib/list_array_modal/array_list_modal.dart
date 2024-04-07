import 'package:flutter/material.dart';

class ArrayListModal extends StatefulWidget {
  const ArrayListModal({super.key});

  @override
  State<ArrayListModal> createState() => _ArrayListModalState();
}

class _ArrayListModalState extends State<ArrayListModal> {
  List<Person> persons = [];

  @override
  void initState() {
    persons.add(
        Person(id: "1", name: "Raj", phone: "12365464895", address: "punjab"));
    persons.add(
        Person(id: "2", name: "Mehak", phone: "5647895145", address: "agra"));
    persons.add(Person(
        id: "3", name: "Subh", phone: "5565145212", address: "himachal"));
    persons.add(
        Person(id: "4", name: "Laxmi", phone: "78945866123", address: "delhi"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Array_List_Modal"),
          backgroundColor: Colors.lightBlue,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: persons.map((data) {
                return Container(
                  child: Card(
                    child: ListTile(
                      title: Text(data.name),
                      subtitle:
                          Text(data.phone + "\n" + data.address),
                      trailing: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
                        child: Icon(Icons.delete),
                        onPressed: () {
                          persons.removeWhere((element) {
                            return element.id == data.id;
                          });
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}

class Person {
  String id, name, phone, address;
  Person(
      {required this.id,
      required this.name,
      required this.phone,
      required this.address});
}
