import 'package:get/get.dart';
import 'package:tmp/controllers/class_controllder.dart';
import 'package:tmp/controllers/message_controller.dart';

class ClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClassController());
    Get.put(MessageController());
  }
}