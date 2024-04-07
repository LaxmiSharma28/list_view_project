import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:screen/list_screen/task2.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isValidEmail(String value) {
    return RegExp(
        r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
        .hasMatch(value);
  }



 checkValidations(){
   if(nameController.text.trim().isEmpty){
     Fluttertoast.showToast(msg: "Please enter Valid Name");
     return false;
   }
   if(emailController.text.trim().isEmpty){
     Fluttertoast.showToast(msg: "Please enter Valid Email");

     return false;
   }
   if(
     !isValidEmail(emailController.text.trim())
   ){
     Fluttertoast.showToast(msg: 'Please enter valid your email');
     return false;

   }
   if(phoneController.text.trim().isEmpty){
     Fluttertoast.showToast(msg: "Please enter Valid Phone");
     return false;
   }
   if(phoneController.text.length<9

   ){
     Fluttertoast.showToast(msg: 'Password should be at least 9 characters');
     return false;

   }
   if(phoneController.text.length>15

   ){
     Fluttertoast.showToast(msg: 'Password should be  less then 15 characters');
     return false;

   }


   if(addressController.text.trim().isEmpty){
     Fluttertoast.showToast(msg: "Please enter Valid Address");
     return false;
   }
   if(passwordController.text.trim().isEmpty){
     Fluttertoast.showToast(msg: "Please enter Valid Password");
     return false;

   }
   else{
     return true;
   }

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 3,
                          child: SizedBox(
                            child: Container(
                              child: SizedBox(
                                // width: 250,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        hintText: "Name",
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        hintText: "Email Address",
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/images/av.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: TextField(
                  controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Phone Number',
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.phone_android))),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 150,
                child: TextField(
                  controller: addressController,
                  maxLines: 100,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Address",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Password",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  if(checkValidations()){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const  Task2Ui() ));
                  }


                },
                child: Container(
                  height: 65,
                  width: 370,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red.shade900,
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
