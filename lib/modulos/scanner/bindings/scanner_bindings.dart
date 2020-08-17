import 'package:barcode_scanner/modulos/scanner/controllers/scanner_controller.dart';
import 'package:barcode_scanner/modulos/scanner/data/database.dart';
import 'package:get/get.dart';
import 'package:barcode_scanner/shared/extensions/debugs/debug_extensions.dart';

class ScannerBindings implements Bindings {
  @override
  void dependencies() {
    if (Get.isRegistered<Database>() == false) {
      Get.put<Database>(
        Database(),
        permanent: true,
      );
    } else {
      this.debug(
          tag: "ScannerBindings",
          msg: "criando dependencias mas ja tem Database");
    }
    Get.put(ScannerController(Get.find<Database>()));
  }
}
