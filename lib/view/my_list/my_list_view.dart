import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../bottom_nav.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getbody(),
      bottomNavigationBar: BottomNavBar(
        currentTab: Routes.myList,
      ),
    );
  }

  Widget getbody() {
    return Container(

    );
  }
}