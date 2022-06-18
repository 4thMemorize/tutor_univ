import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tmp/controllers/class_controllder.dart';

class FeedList extends StatelessWidget {
  const FeedList({Key? key}) : super(key: key);

  final classController = Get.find<ClassController>();

  @override
  Widget build(BuildContext context, int idx) {
    return ListView.builder(
      itemCount: classController.classes.length,
      itemBuilder: ClassFactory().build(classController.classes[idx]),
    )
  }
}