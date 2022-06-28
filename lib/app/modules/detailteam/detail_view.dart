import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_controller.dart';

// ignore: must_be_immutable
class DetailView extends StatelessWidget {
  late DetailController cx;

  @override
  Widget build(BuildContext context) {
    cx = Get.find<DetailController>();

    return Scaffold(
      appBar: AppBar(
          title: Text('${Get.arguments.strTeam!}'.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Since " + Get.arguments.intFormedYear)),
                SizedBox(height: 10),
                Center(
                  child: Container(
                    width: 200,
                    child: Image.network(
                      Get.arguments.strTeamBadge!,
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset("assets/images/image-error.png");
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(Get.arguments.strDescriptionEN!), //strManager
                SizedBox(height: 10),
                Center(
                  child: Container(
                    // width: 200,
                    child: Image.network(
                      Get.arguments.strStadiumThumb!,
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset("assets/images/image-error.png");
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Stadium : ",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text(Get.arguments.strStadium!),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Location : ",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Flexible(
                      child: Text(
                        Get.arguments.strStadiumLocation!,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Capacity : ",
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text(Get.arguments.intStadiumCapacity!),
                  ],
                ),
                SizedBox(height: 10),
                Text(Get.arguments.strStadiumDescription!),
                SizedBox(height: 10),
                Text(
                  "League : ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Get.arguments.strLeague != null
                    ? Text(Get.arguments.strLeague!.toString())
                    : Container(),
                Get.arguments.strLeague2 != null
                    ? Text(Get.arguments.strLeague2!.toString())
                    : Container(),
                Get.arguments.strLeague3 != null
                    ? Text(Get.arguments.strLeague3!.toString())
                    : Container(),
                Get.arguments.strLeague4 != null
                    ? Text(Get.arguments.strLeague4!.toString())
                    : Container(),
                Get.arguments.strLeague5 != null
                    ? Text(Get.arguments.strLeague5!.toString())
                    : Container(),
                Get.arguments.strLeague6 != null
                    ? Text(Get.arguments.strLeague6!.toString())
                    : Container(),
                Get.arguments.strLeague7 != null
                    ? Text(Get.arguments.strLeague7!.toString())
                    : Container(),
                SizedBox(height: 20),
                Row(
                  children: [
                    Image.asset("assets/images/internet.png", width: 30),
                    SizedBox(width: 10),
                    Text(Get.arguments.strWebsite!),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset("assets/images/facebook.png", width: 30),
                    SizedBox(width: 10),
                    Text(Get.arguments.strFacebook!),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset("assets/images/twitter.png", width: 30),
                    SizedBox(width: 10),
                    Text(Get.arguments.strTwitter!),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset("assets/images/instagram.png", width: 30),
                    SizedBox(width: 10),
                    Text(Get.arguments.strInstagram!),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


                            

                           


                            // Text(cx.list_team[index].strKitColour1!),
                            // Text(cx.list_team[index].strKitColour2!),
                            // Text(cx.list_team[index].strKitColour3!),
                           

                            
                            // Text(cx.list_team[index].strTeamJersey!),
                            // Text(cx.list_team[index].strTeamLogo!),
                            // Text(cx.list_team[index].strTeamFanart1!),
                            // Text(cx.list_team[index].strTeamFanart2!),
                            // Text(cx.list_team[index].strTeamFanart3!),
                            // Text(cx.list_team[index].strTeamFanart4!),
                            // Text(cx.list_team[index].strTeamBanner!),
                            // Text(cx.list_team[index].strYoutube!),
                            // Text(cx.list_team[index].strLocked!),
