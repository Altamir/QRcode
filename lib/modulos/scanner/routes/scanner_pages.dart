import 'package:barcode_scanner/modulos/scanner/bindings/scanner_bindings.dart';
import 'package:barcode_scanner/modulos/scanner/pages/scanner_page.dart';
import 'package:get/get.dart';

part './scanner_routes.dart';

class ScannerPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.SCANNER,
      page: () => ScannerPage(),
      binding: ScannerBindings(),
    ),
  ];
}
