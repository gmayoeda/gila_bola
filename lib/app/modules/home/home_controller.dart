// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gila_bola/app/data/models/team.dart';
import 'package:gila_bola/app/data/providers/team_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/dialog.dart';

class HomeController extends GetxController {
  RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  TextEditingController cari = TextEditingController();

  RxList<Teams> list_team = <Teams>[].obs;

  RxList<Teams> searchResult = <Teams>[].obs;

  void callTeam() {
    _isLoading.value = true;
    TeamProvider().getTeam().then((TeamsLeague team) {
      if (team.teams!.isNotEmpty) {
        list_team.addAll(team.teams!);
        searchResult.value = list_team;
      }
      _isLoading.value = false;
    }).onError((error, stackTrace) {
      showSnackBar(error, onButtonClick: () {});
    });
  }

  void onSearchTextChanged(String value) async {
    // print(value);

    searchResult.clear();
    if (value.isEmpty) {
      searchResult.clear();
      callTeam();
    }
    _isLoading.value = true;

    searchResult.value = list_team
        .where(
          (data) => data.strTeam!.toUpperCase().contains(value.toUpperCase()),
        )
        .toList();
    _isLoading.value = false;
  }

  void urlrss(url) async {
    if (!await launch(url, forceSafariVC: true)) throw 'Could not launch $url';
  }

  @override
  void onInit() {
    callTeam();
    super.onInit();
  }

  @override
  void onClose() {}
}

// Search for team by name
// https://www.thesportsdb.com/api/v1/json/2/searchteams.php?t=Arsenal *Patreon ONLY*

// Team Details by Id
// https://www.thesportsdb.com/api/v1/json/2/lookupteam.php?id=133604 *Patreon ONLY*
