import 'package:barcode_scanner/modulos/scanner/data/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:barcode_scanner/shared/extensions/debugs/debug_extensions.dart';
import 'package:barcode_scanner/shared/extensions/clipboard/clipboart_extension.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScannerController extends GetxController {
  final Database _database;

  final isBusy = false.obs;
  final code = "".obs;
  final RxList<Leitura> leituras = RxList<Leitura>([]);

  ScannerController(this._database);

  @override
  void onInit() async {
    this.debug(tag: "ScannerController", msg: "Iniciado");
    leituras.bindStream(_database.streamLeituras());
  }

  Future scann() async {
    code.value = await scanner.scan();
    this.debug(tag: "ScannerController", msg: code.value);
    _database.createOrUpdateLeitura(Leitura(dado: code.value, id: null));
    await copyValue(code.value);
  }

  Future copyValue(String value) async {
    await value.copy();
    Get.snackbar(
      "Codigo copiado.",
      "O codigo lido foi copiado para a area de transferencia.",
      snackPosition: SnackPosition.TOP,
      icon: Icon(Icons.content_copy),
    );
  }

  Future removeLeitura(int id) {
    return _database.remover(id);
  }
}
