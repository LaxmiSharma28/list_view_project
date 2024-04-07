import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:screen/Api/FirstModal.dart';

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  FirstModal modal = FirstModal();
  bool isLoading = false;

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await http
          .get(Uri.parse("https://api.nationalize.io?name=nathaniel"));
      setState(() {
        isLoading = false;
      });
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        modal = FirstModal.fromJson(responseData);
        setState(() {});
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modal"),
        backgroundColor: Colors.orange,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: modal.country!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(modal.count.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(modal.name.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(modal.country![index].countryId.toString()),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(modal.country![index].probability.toString()),
                    ],
                  ),
                );
              }),
    );
  }
}
