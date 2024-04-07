import 'package:flutter/material.dart';

class CheckBoxExample extends StatefulWidget {
  const CheckBoxExample({super.key});

  @override
  State<CheckBoxExample> createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  bool selectAll=false;
  List<bool> checkboxValues = [false, false, false, false, false];

   toggleSelectAll(bool value) {
    setState(() {
      selectAll = value;
      checkboxValues = List.filled(checkboxValues.length, value);
    });
  }

  void toggleCheckbox(int index, bool value) {
    setState(() {
      checkboxValues[index] = value;
      if (!value && selectAll) {
        selectAll = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Select All'),
                Checkbox(
                  value: selectAll,
                  onChanged:(value) {
                    toggleSelectAll(value!);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            for (int i = 0; i < checkboxValues.length; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Checkbox $i'),
                  Checkbox(
                    value: checkboxValues[i],
                    onChanged: (value) => toggleCheckbox(i, value!),
                  ),
                  Icon(Icons.delete),
                  Image(image: AssetImage("assets/images/social.png"),height: 50,width: 50,)
                ],
              ),
          ],
        ),
      ),
    );

  }
}
