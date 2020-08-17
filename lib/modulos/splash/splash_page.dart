import 'package:barcode_scanner/modulos/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: Get.width * 0.9,
              child: GestureDetector(
                onTap: () => controller.troca(),
                child: Card(
                  child: Obx(
                    () => Center(
                      child: Text(
                        controller.msg.value,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: LinearProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
