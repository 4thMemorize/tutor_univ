import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tmp/controllers/class_controllder.dart';
import 'package:tmp/data/tutoring.dart';

import 'class_factory.dart';

class ClassList extends StatelessWidget {
  const ClassList({Key? key, required this.classesList}) : super(key: key);
  final List<Tutoring> classesList;

  @override
  Widget build(BuildContext context) {
    final ClassController classController = Get.find<ClassController>();
    return ListView.builder(
      itemCount: classController.classes.length,
      itemBuilder: listBuilder,
    );
  }

  Widget listBuilder(BuildContext context, int idx) => ClassFactory().build(context, classesList[idx]);
}