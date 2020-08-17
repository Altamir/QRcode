import 'package:barcode_scanner/modulos/scanner/routes/scanner_pages.dart';
import 'package:barcode_scanner/modulos/splash/frases.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final Frases frases = Frases();

  final msg = ''.obs;

  @override
  void onInit() async {
    msg.value = "Iniciando";
  }

  @override
  void onReady() async {
    msg.bindStream(iniciar());
  }

  Stream<String> iniciar() async* {
    yield 'Iniciando..';
    yield frases.randon();
    await Future.delayed(Duration(seconds: 3));
    yield '#partiu';
    Get.offAndToNamed(Routes.SCANNER);
  }

  troca() {
    msg.value = frases.randon();
  }
}
