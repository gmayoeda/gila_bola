import 'package:get/get.dart';
import 'package:gila_bola/app/data/models/team.dart';

import '../server.dart';

class TeamProvider extends GetConnect {
  Future<TeamsLeague> getTeam() async {
    final response = await get(
      // 'https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php',
      Server.url +
          'api/v1/json/2/search_all_teams.php?l=English%20Premier%20League',
      query: {'l': 'English Premier League'},
    );
    try {
      print("DATA RESPONSE TEAM : ${response.body}");
      return TeamsLeague.fromJson(response.body);
    } catch (e) {
      throw Exception();
    }
  }
}
