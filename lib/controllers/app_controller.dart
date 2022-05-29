import 'package:get/get.dart';

enum Mode {Tutor, Tutee}

extension ParseToString on Mode {
  String toShortString() {
    return toString().split('.').last;
  }
}

class AppController extends GetxService {
  @override
  void onInit() {
    super.onInit();
  }
  Rx<Mode> appMode = Mode.Tutee.obs;

  void changeMode() {
    if(appMode.value == Mode.Tutee) {
      appMode.value = Mode.Tutor;
    } else {
      appMode.value = Mode.Tutee;
    }
  }
}