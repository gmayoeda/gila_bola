import 'splashscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  late splashscreenController cx;
  @override
  Widget build(BuildContext context) {
    cx = Get.find<splashscreenController>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                child: Image.asset(
                  'assets/images/soccerbg.jpg',
                  fit: BoxFit.cover,
                  // width: 220,
                ),
              ),
            ],
          ),
          Positioned(
            child: Image.asset(
              'assets/images/soccerlogo.png',
              fit: BoxFit.cover,
              width: 300,
            ),
          ),
        ],
      ),
    );
  }
}
