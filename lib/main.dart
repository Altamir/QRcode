import 'package:barcode_scanner/routes/app_routes.dart';
import 'package:barcode_scanner/shared/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
    ),
  );
}
