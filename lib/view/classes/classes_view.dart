import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tmp/controllers/app_controller.dart';
import 'package:tmp/controllers/class_controllder.dart';
import 'package:tmp/view/classes/class_card.dart';
import 'package:tmp/view/classes/class_list.dart';

import '../bottom_nav.dart';

class ClassesView extends StatefulWidget {
  const ClassesView({Key? key}) : super(key: key);

  @override
  State<ClassesView> createState() => _ClassesViewState();
}

class _ClassesViewState extends State<ClassesView> {
  final appController = Get.find<AppController>();
  final classController = Get.put(ClassController());

  List _filterOptions = [];

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
      child: GetBuilder<ClassController>(
        builder: (bcontext) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              // color: appController.appMode.value == Mode.Tutee
              //   ? Color(0xFF33FFCC)
              //   : Color(0xFF33CCFF)
              color: Colors.white
            ),
            child: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
                return [
                  SliverAppBar(
                    toolbarHeight: 150,
                    elevation: 0,
                    automaticallyImplyLeading: false,
                    titleSpacing: 0,
                    backgroundColor: Color(0xFFFFFFFF),
                    title: Container(
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
                                  child: Obx(() {
                                    return Container(
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
                                            color: Colors.black
                                          ),
                                        ),
                                      ),
                                    );
                                  })
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
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ];
              },
              body: Column(
                children: [
                  getCategoryBar(),
                  SizedBox(
                    width: 1,
                    height: 20,
                  ),
                  Expanded(
                    child: ClassList(classesList: classController.classes)
                  )
                ],
              )
            )
          );
        }
      ),
    );
  }

  Widget getCategoryBar() {
    final double width = Get.width;
    return Container(
      constraints: BoxConstraints(maxHeight: 48),
      padding: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
      width: width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: this.getCategoryButtons(categories: ['coding', 'piano', 'english', 'etc']),
        ),
      ),
    );
  }

  List<Widget> getCategoryButtons({
    required List categories
  }) {
    List<Widget> buttons = [];
    categories.asMap().forEach((key, value) {
      buttons.add(GestureDetector(
        onTap: () {
          setState(() {
            isContainedCategory(value)
                ? _filterOptions.removeWhere((item) => item == value)
                : _filterOptions.add(value);
          });
          classController.updateFilter(_filterOptions);
        },
        child: Container(
          height: 32,
          padding: EdgeInsets.only(
            top: 8,
            left: 12,
            bottom: 8,
            right: 12,
          ),
          margin: EdgeInsets.only(
              left: key == 0 ? 12 : 4,
              right: key == categories.length - 1 ? 12 : 4),
          decoration: BoxDecoration(
            color: getCategoryBoxColor(value),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
          ),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ));
    });
    return buttons;
  }

  bool isContainedCategory(String category) {
    return _filterOptions.contains(category);
  }

  Color getCategoryBoxColor(String category) {
    final result = isContainedCategory(category);
    if (result) {
      return appController.appMode.value == Mode.Tutee
      ? Color(0xFF33FFCC)
      : Color(0xFF33CCFF);
    } else {
      return Colors.white;
    }
  }
}