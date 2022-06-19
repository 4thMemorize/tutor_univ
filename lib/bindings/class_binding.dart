import 'package:get/get.dart';
import 'package:tmp/controllers/class_controllder.dart';

class ClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ClassController());
  }
}