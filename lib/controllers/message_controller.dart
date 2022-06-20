import 'package:get/get.dart';
import 'package:tmp/data/tutoring.dart';

class Message {
  late String flag;  //inquiry  request
  late Tutoring? content;

  Message(
    this.flag,
    this.content
  );
}

class MessageController extends GetxController {
  List<Message> messageList = [];
}