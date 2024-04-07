import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen/Api/post_model.dart';

Future<void> main() async {
  Get.put(AllApi());

  runApp(GetMaterialApp(home: AllApi()));
}

class AllApi extends StatefulWidget {

  const AllApi({super.key});

  @override
  State<AllApi> createState() => _AllApiState();
}

class _AllApiState extends State<AllApi> {
  final StudentController textController = Get.put(StudentController());
  PostModall modal= PostModall();
  List<dynamic> data=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest API"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                textController.studentsLoading();
              },
              child: const Text("GetAll"),
            ),
            ElevatedButton(
              onPressed: () {
                textController.studentsLoading();
              },
              child: const Text("GetByName"),
            ),
            ElevatedButton(
              onPressed: () {
                textController.studentsLoading;
              },
              child: const Text("GetByCount"),
            ),


            ElevatedButton(
              onPressed: () {},
              child: const Text("Update"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Remove "),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentController extends GetxController {
  final studentsLoading = false.obs;

  // final StudentProvider studentProvider = Get.find();

//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     await getAllStudent();
//   }
//
//   Future<void> getAllStudent() async {
//     studentsLoading.value = true;
//     try {
//       var response = await studentProvider.getAll();
//       print(response.body);
//     } finally {
//       studentsLoading.value = false;
//     }
//   }
//
//   Future<void> getStudentById(String id) async {
//     studentsLoading.value = true;
//     try {
//       var response = await studentProvider.getById(id);
//       print(response.body);
//     } finally {
//       studentsLoading.value = false;
//     }
//   }
//
//   Future<void> createStudent() async {
//     studentsLoading.value = true;
//     try {
//       var response = await studentProvider.create(Response());
//       print(response.body);
//     } finally {
//       studentsLoading.value = false;
//     }
//   }
//
//   Future<void> updateStudent(String String) async {
//     studentsLoading.value = true;
//     try {
//       var response = await studentProvider.update(Response());
//       print(response.body);
//     } finally {
//       studentsLoading.value = false;
//     }
//   }
//
//   Future<void> removeStudent(String id) async {
//     studentsLoading.value = true;
//     try {
//       var response = await studentProvider.remove(id);
//       print(response.body);
//     } finally {
//       studentsLoading.value = false;
//     }
//   }
// }



// class StudentProvider extends GetConnect {
//   @override
//   void onInit() {
//     httpClient.baseUrl = 'https://api.genderize.io/?name=luc';
//   }
//
//   Future<Response<List<dynamic>>> getAll() =>
//       get('https://api.genderize.io/?name=luc', decoder: Response.getAll());
//   Future<Response<PostModall>> getById(String id) =>
//       get('https://api.genderize.io/?name=luc/$id', decoder: Response.fromJson);
//   Future<Response<PostModall>> create(Response) =>
//       post('https://api.genderize.io/?name=luc', Response().toJson(), decoder: Response.fromJson);
//   Future<Response<PostModall>> update(Response Respose) =>
//       put('https://api.genderize.io/?name=luc${Response.[id]}', Response.toJson(),
//           decoder: Response String);
//   Future<Response> remove(String id) => delete('/students/$id');
// }


  // toString
      }
