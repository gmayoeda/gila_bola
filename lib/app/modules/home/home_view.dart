import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gila_bola/app/routes/app_pages.dart';

import '../../utils/loading_view.dart';
import 'home_controller.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  late HomeController cx;

  @override
  Widget build(BuildContext context) {
    cx = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'English Football League',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              // controller: cx.cari,
              onChanged: (value) {
                cx.onSearchTextChanged(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search by Team Name',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx((() => cx.isLoading == true
                  ? LoadingView()
                  : cx.searchResult.isNotEmpty
                      ? ListView.builder(
                          itemCount: cx.searchResult.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 0.5,
                                    color: Colors.grey.withOpacity(0.2)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 5.0,
                                    offset: Offset(0.0, 2.0),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: SizedBox(
                                      width: 120,
                                      // height: 100,
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.DETAIL,
                                              arguments:
                                                  cx.searchResult[index]);
                                        },
                                        child: Image.network(
                                          cx.searchResult[index].strTeamBadge!,
                                          fit: BoxFit.fitWidth,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                                "assets/images/image-error.png");
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Center(
                                      child: Text(
                                    "Click image for more details",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[400]),
                                  )),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        cx.searchResult[index].strTeam!,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 3),
                                      cx.searchResult[index].strTeamShort !=
                                              null
                                          ? Text(
                                              "(" +
                                                  cx.searchResult[index]
                                                      .strTeamShort
                                                      .toString() +
                                                  ")",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : SizedBox(),
                                      SizedBox(width: 3),
                                      Text(
                                        cx.searchResult[index].strCountry!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        cx.searchResult[index].intFormedYear!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Text(cx.searchResult[index].strAlternate!),
                                  Text("Keywords : " +
                                      cx.searchResult[index].strKeywords!),
                                  cx.searchResult[index].strRSS != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: InkWell(
                                              onTap: (() {
                                                cx.urlrss(cx.searchResult[index]
                                                    .strRSS!);
                                              }),
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    cx.searchResult[index]
                                                        .strRSS!,
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ))),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            );
                          },
                        )
                      : Center(child: Text("Data tidak ditemukan!")))),
            ),
          ],
        ),
      ),
    );
  }
}
