import 'package:barcode_scanner/modulos/splash/splash_bindings.dart';
import 'package:barcode_scanner/modulos/splash/splash_page.dart';
import 'package:get/get.dart';

class SplashPages {
  static final List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
  ];
}
