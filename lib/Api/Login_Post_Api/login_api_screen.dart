import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'home_testing_screen.dart';
import 'login_api_model.dart';

class GetApiScreenTest extends StatefulWidget {
  const GetApiScreenTest({super.key});

  @override
  State<GetApiScreenTest> createState() => _GetApiScreenTestState();
}

class _GetApiScreenTestState extends State<GetApiScreenTest> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
  }

  deviceId() async {
    String? deviceId = await _getId();
    print("Device Id======>>>>>> $deviceId");
  }

  LoginModel modal = LoginModel();
  var fcm_token =
      "ezo8U7oITomgVkXNPRFUdm:APA91bGfJtVSYtPPziN95sCDa5MU7FEiwPbIDfF1WjKZ6vJVfiscUoEETHDmWgXcYxtCkLR6XQxkv0YCBjel36Gva4komvbrrfp9wy8h9t0WZX21zDp2W4CLhSSDkVdr1MxceN7W-VM3";

  postData(
      {required String email,
      required String password,
      required String fcm_token}) async {
    var deviceId = await _getId();
    var response = await http.post(
        Uri.parse("https://admin.e-shopon.com/api/login"),
        headers: <String, String>{
          'x-api-key': 'd2h94mh4-f5h2-70f0-9217-v037v57810e72720',
        },
        body: {
          "email": email,
          "password": password,
          "device_id": deviceId,
          "fcm_token": fcm_token
        });

    print({
      'email': email,
      'password': password,
      "device_id": deviceId,
      "fcm_token": fcm_token
    });

    if (response.statusCode == 201) {
      var responseData = jsonDecode(response.body);
      modal = LoginModel.fromJson(responseData);
      print("Final=========>>>>>>>>> ${responseData['user']['name']}");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const GetTesting()));
      setState(() {});
    } else if (response.statusCode == 400) {
      throw Exception('<<<<<<<<<<Failed to Login>>>>>>>>>>');
    }
  }

  @override
  void initState() {
    deviceId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFormField(
                  controller: emailController,
                  showCursor: true,
                  decoration: InputDecoration(
                      hintText: "Email",
                      label: const Text("Email"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Password",
                      label: const Text("Password"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(height: 30),
                FilledButton(
                  onPressed: () {
                    if (checkValidations()) {
                      postData(
                          email: emailController.text,
                          password: passwordController.text,
                          fcm_token: fcm_token);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String value) {
    return RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
        .hasMatch(value);
  }

  checkValidations() {
    if (emailController.text.trim().isEmpty) {
      Fluttertoast.showToast(msg: "Please enter Valid Email");

      return false;
    }
    if (!isValidEmail(emailController.text.trim())) {
      Fluttertoast.showToast(msg: 'Please enter valid your email');
      return false;
    }

    if (passwordController.text.length < 5) {
      Fluttertoast.showToast(msg: 'Password should be at least 9 characters');
      return false;
    }
    if (passwordController.text.length > 15) {
      Fluttertoast.showToast(
          msg: 'Password should be  less then 15 characters');
      return false;
    } else {
      return true;
    }
  }
}
