import 'package:flutter/material.dart';

class FilterTest extends StatefulWidget {
  const FilterTest({super.key});

  @override
  State<FilterTest> createState() => _FilterTestState();
}

class _FilterTestState extends State<FilterTest> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, String>> _allUsers = [
    { "name": "India", },
    { "name": "Canada", },
    { "name": "Barzil", },
    { "name": "USA",},
    { "name": "Japan",},
    {"name": "China",},
    {"name": "Uk",},
    { "name": "Uganda",},
    { "name": "Uruguay", },
    { "name": "Singapur", },
  ];


  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {

    _foundUsers = _allUsers;
    super.initState();
  }


  void _runFilter(String enteredKeyword) {
    List<Map<String, String>> results = [];
    if (enteredKeyword.isEmpty) {

      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"]!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();

    }


    setState(() {
      _foundUsers = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]),
                  color: Colors.amberAccent,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(

                    title: Text(_foundUsers[index]['name']),

                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}