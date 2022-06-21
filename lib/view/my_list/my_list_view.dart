import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tmp/controllers/app_controller.dart';
import 'package:tmp/controllers/my_list_controller.dart';
import 'package:tmp/view/classes/class_card.dart';
import 'package:tmp/view/my_list/my_list_card_student.dart';
import 'package:tmp/view/my_list/my_list_card_teacher.dart';

import '../bottom_nav.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final appController = Get.find<AppController>();

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
    return SafeArea(
      child: Obx(() {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          // color: appController.appMode.value == Mode.Tutee
          //   ? Color(0xFF33FFCC)
          //   : Color(0xFF33CCFF)
          color: Colors.white
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => appController.changeMode(),
                    child: Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05
                      ),
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: appController.appMode.value == Mode.Tutee
                      ? Color(0xFF33FFCC)
                      : Color(0xFF33CCFF),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Text(
                          appController.appMode.value.toShortString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                appController.appMode.value == Mode.Tutor
                  ? Get.toNamed('/dashboard_teacher')
                  : Get.toNamed('/dashboard_student');
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Text(
                    appController.appMode.value == Mode.Tutor
                      ? 'Teaching\nDashboard'
                      : 'Learning\nDashboard',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 1,
              height: 10,
            ),
            Expanded(
              child: appController.appMode.value == Mode.Tutor
                ? ListView(children: [MyListCardT(), MyListCardT()],)
                : listBuilder(context)
            )
          ]
        )
      );
      })
    );
  }

  Widget listBuilder(BuildContext context) {
    MyListController myListController;
    if(Get.isRegistered<MyListController>()) {
      myListController = Get.find<MyListController>();
    }
    else {
      myListController = Get.put(MyListController());
    }
    return ListView.builder(
      itemCount: myListController.tutoringList.length,
      itemBuilder: generate,
    );
  }

  Widget generate(BuildContext context, int idx) {
    final MyListController myListController = Get.find<MyListController>();
    return MyListCardS(myListController.tutoringList[idx]);
  }
}