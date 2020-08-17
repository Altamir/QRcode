import 'package:flutter/services.dart';

extension CopyStringForClipboard on String {
  copy() async {
    if (this.isNotEmpty) {
      await Clipboard.setData(ClipboardData(text: this));
    }
  }
}
