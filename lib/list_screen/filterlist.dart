import 'package:flutter/material.dart';

class FilterListUi extends StatefulWidget {
  const FilterListUi({super.key});

  @override
  State<FilterListUi> createState() => _FilterListUiState();
}

class _FilterListUiState extends State<FilterListUi> {
  List<String> countries = [
    "Canada",
    "Brazil",
    "USA",
    "Japan",
    "China",
    "UK",
    "Uganda",
    "Uruguay"
  ];

  List<String> filter = [];

  @override
  void initState() {
    filter.addAll(countries);
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<String> results = [];
    if (enteredKeyword.isEmpty) {
      results = countries;
    } else {
      results = countries
          .where((user) =>
              user.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      filter = results;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Filter Listview"),
          backgroundColor: Colors.yellow,
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
                child: filter.isNotEmpty
                    ? ListView.builder(
                        itemCount: filter.length,
                        itemBuilder: (context, index) => Card(
                          key: ValueKey(filter[index]),
                          color: Colors.amberAccent,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Text(filter[index]),
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
        ));
  }
}
