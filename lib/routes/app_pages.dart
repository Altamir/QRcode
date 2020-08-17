import 'package:barcode_scanner/modulos/scanner/routes/scanner_pages.dart';
import 'package:barcode_scanner/modulos/splash/splash_pages.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = (SplashPages.pages + ScannerPages.pages);
}
