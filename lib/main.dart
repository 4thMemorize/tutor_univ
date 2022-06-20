import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmp/bindings/class_binding.dart';
import 'package:tmp/view/classes/class_detail.dart';
import 'package:tmp/view/classes/classes_view.dart';
import 'package:tmp/view/info/info_view.dart';
import 'package:tmp/view/join/join.dart';
import 'package:tmp/view/message/message_room.dart';
import 'package:tmp/view/message/message_view.dart';
import 'package:tmp/view/my_list/dashboard_student.dart';
import 'package:tmp/view/my_list/dashboard_teacher.dart';
import 'package:tmp/view/my_list/my_list_view.dart';
import 'package:tmp/view/payment.dart';
import 'package:tmp/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TutorUniv',
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => Splash(),
          transition: Transition.noTransition
        ),
        GetPage(
          name: '/join',
          page: () => Join(),
          transition: Transition.noTransition
        ),
        GetPage(
          name: '/classes',
          page: () => ClassesView(),
          transition: Transition.noTransition,
          binding: ClassBinding()
        ),
        GetPage(
          name: '/class_detail',
          page: () => ClassDetail(),
          transition: Transition.noTransition
        ),
        GetPage(
          name: '/myList',
          page: () => MyListView(),
          transition: Transition.noTransition
        ),
        GetPage(
          name: '/dashboard_teacher',
          page: () => DashboardT(),
          transition: Transition.noTransition
        ),
        GetPage(
          name: '/dashboard_student',
          page: () => DashboardS(),
          transition: Transition.noTransition
        ),
        GetPage(
          name: '/message',
          page: () => MessageView(),
          transition: Transition.noTransition
        ),
        GetPage(
          name: '/message_room',
          page: () => MessageRoom(),
          transition: Transition.noTransition
        ),
        GetPage(
          name: '/payment',
          page: () => Payment(),
          transition: Transition.noTransition
        ),
        GetPage(
          name: '/info',
          page: () => InfoView(),
          transition: Transition.noTransition
        ),
        GetPage(
          name: '/classes',
          page: () => ClassesView(),
          transition: Transition.noTransition
        ),
      ],
    );
  }
}