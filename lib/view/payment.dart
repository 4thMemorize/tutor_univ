import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tmp/controllers/class_controllder.dart';
import 'package:tmp/controllers/my_list_controller.dart';
import 'package:tmp/data/ongoing_tutoring.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClassController classController = Get.find<ClassController>();
    MyListController myListController;
    if(Get.isRegistered<MyListController>()) {
      myListController = Get.find<MyListController>();
    }
    else {
      myListController = Get.put(MyListController());
    }
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          myListController.tutoringList.add(OngoingTutoring(
            classController.selectedClass!.category, 
            classController.selectedClass!.path, 
            classController.selectedClass!.name, 
            DateTime(2022, 06, 21), 
            DateTime(2022, 07, 21))
          );
          Get.toNamed('/myList');
        },
        child: Center(
          child: Image.asset(
            'assets/payment.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ),
    );
  }
}