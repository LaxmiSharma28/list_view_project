import 'package:flutter/material.dart';

class CheckBoxUi extends StatefulWidget {
  const CheckBoxUi({super.key});

  @override
  State<CheckBoxUi> createState() => _CheckBoxUiState();
}

class _CheckBoxUiState extends State<CheckBoxUi> {
  bool SelectAll = false;
  List<bool> CheckBoxValue = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  toggleSelectAll(bool value) {
    setState(() {
      SelectAll = value;
      CheckBoxValue = List.filled(CheckBoxValue.length, value);
    });
  }

  void toggleCheckbox(int index, bool value) {
    setState(() {
      CheckBoxValue[index] = value;
      if (value && SelectAll) {
        SelectAll = false;
      }
    });
  }

  // List<bool> isChecked=List<bool>.generate(9, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
            height: 25,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    "assets/images/gmail.png",
                  ),
                ),
                Text(
                  "   Gmail",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          backgroundColor: Colors.purple.shade200),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Container(
              height: 60,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.purple.shade300, width: 2),
              ),
              child: Row(
                children: [
                  Checkbox(
                      value: SelectAll,
                      activeColor: Colors.purple.shade300,
                      onChanged: (value) {
                        toggleSelectAll(value!);
                      }),
                  const Text(
                    "Select All",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          for (int i = 0; i < CheckBoxValue.length; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Checkbox(
                    value: CheckBoxValue[i],
                    activeColor: Colors.purple.shade300,
                    onChanged: (value) => toggleCheckbox(i, value!)),
                const Image(
                  image: AssetImage("assets/images/social.png"),
                  height: 80,
                  width: 80,
                ),
                Text(
                  "Welcome$i",
                  style: const TextStyle(fontSize: 20),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        CheckBoxValue.removeAt(i);
                      });
                    },
                    icon: const Icon(Icons.delete))
              ],
            )
        ],
      ),
    );
  }
}
