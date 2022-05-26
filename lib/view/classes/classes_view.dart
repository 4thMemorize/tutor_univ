import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../bottom_nav.dart';

class ClassesView extends StatefulWidget {
  const ClassesView({Key? key}) : super(key: key);

  @override
  State<ClassesView> createState() => _ClassesViewState();
}

class _ClassesViewState extends State<ClassesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getbody(),
      bottomNavigationBar: BottomNavBar(
        currentTab: Routes.classes,
      ),
    );
  }

  Widget getbody() {
    return Container(

    );
  }
}