import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tmp/view/bottom_nav.dart';

class DashboardS extends StatefulWidget {
  const DashboardS({Key? key}) : super(key: key);

  @override
  State<DashboardS> createState() => _DashboardSState();
}

class _DashboardSState extends State<DashboardS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavBar(
        currentTab: Routes.myList,
      ),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Container(
        child: Text('student'),
      ),
    );
  }
}