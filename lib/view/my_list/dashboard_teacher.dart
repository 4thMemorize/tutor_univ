import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tmp/view/bottom_nav.dart';

class DashboardT extends StatefulWidget {
  const DashboardT({Key? key}) : super(key: key);

  @override
  State<DashboardT> createState() => _DashboardTState();
}

class _DashboardTState extends State<DashboardT> {
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
        child: Text('teacher'),
      ),
    );
  }
}