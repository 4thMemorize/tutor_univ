import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tmp/controllers/app_controller.dart';
import 'package:tmp/view/classes/class_card.dart';

import '../bottom_nav.dart';

class ClassesView extends StatefulWidget {
  const ClassesView({Key? key}) : super(key: key);

  @override
  State<ClassesView> createState() => _ClassesViewState();
}

class _ClassesViewState extends State<ClassesView> {
  final appController = Get.find<AppController>();

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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                    ),
                    child: Text(
                      'Recommended\nClasses',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1,
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ClassCard(),
                      SizedBox(
                        height: 10,
                      ),
                      ClassCard(),
                      SizedBox(
                        height: 10,
                      ),
                      ClassCard(),
                      SizedBox(
                        height: 10,
                      ),
                      ClassCard(),
                      SizedBox(
                        height: 10,
                      ),
                      ClassCard(),
                      SizedBox(
                        height: 10,
                      ),
                      ClassCard(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            )
          );
        }
      ),
    );
  }
}