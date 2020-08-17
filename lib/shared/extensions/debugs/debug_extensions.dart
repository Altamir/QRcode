import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

extension Debugs on Object {
  ///Metodo que printa mensagem no console, depende do GetX
  ///
  ///Exemplo de uso:
  ///
  ///     this.debug(tag: "Exemplo", msg: "na rota ${Get.currentRoute}");
  ///
  /// Saida sera:
  ///
  ///      I/flutter ( 6838): [Exemplo] na rota /home
  ///
  debug({String tag = "APP", @required String msg}) {
    if (GetConfig.isLogEnable) print("[$tag] $msg");
  }

  ///Metodo que printa toString no console, depende do GetX
  ///
  ///Exemplo de uso:
  ///     final item = "casa";
  ///     item.debugMe(tag: "Exemplo");
  ///
  /// Saida sera:
  ///
  ///      I/flutter ( 6838): [Exemplo] casa
  ///
  debugMe({String tag = "APP"}) {
    if (GetConfig.isLogEnable) print("[$tag] ${this.toString()}");
  }
}
