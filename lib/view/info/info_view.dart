import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../bottom_nav.dart';

class InfoView extends StatefulWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getbody(),
      bottomNavigationBar: BottomNavBar(
        currentTab: Routes.info,
      ),
    );
  }

  Widget getbody() {
    return Container(

    );
  }
}