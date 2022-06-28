import 'dart:async';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class splashscreenController extends GetxController {
  selection() {
    return Timer(Duration(seconds: 3), () {
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void onReady() {
    selection();
    super.onReady();
  }
}
