// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailController extends GetxController {
  void url(url) async {
    if (!await launch(url, forceSafariVC: true)) throw 'Could not launch $url';
  }

  @override
  void onInit() {
    super.onInit();
  }
}
