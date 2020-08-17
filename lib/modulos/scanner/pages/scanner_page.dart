import 'package:barcode_scanner/modulos/scanner/controllers/scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:barcode_scanner/shared/extensions/clipboard/clipboart_extension.dart';

import 'package:barcode_scanner/shared/extensions/date_time/date_time_extensions.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ScannerPage extends GetView<ScannerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(
        () => controller.isBusy.value ?? false
            ? Container()
            : FloatingActionButton(
                child: Icon(Icons.camera_alt),
                onPressed: () async {
                  await controller.scann();
                },
              ),
      ),
      appBar: AppBar(
        title: Text('Scanner'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationName: "Scanner codes",
                    children: <Widget>[
                      Text(
                          "Barcode Scanner desenvolvido em flutter, com intuito de praticar conhecimentos."),
                    ]);
              })
        ],
      ),
      body: Container(
        child: GetX<ScannerController>(
          builder: (_) {
            return Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              onTap: () =>
                                  _.code.value == null || _.code.value.isEmpty
                                      ? _.scann()
                                      : Get.defaultDialog(
                                          title: "Codigo lido",
                                          middleText: _.code.value),
                              title: Text(
                                'Ultimo Dado Lido:',
                                style: TextStyle(fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                _.code.value,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: Icon(
                                Icons.streetview,
                                color: Colors.blue[500],
                              ),
                              trailing:
                                  _.code.value == null || _.code.value.isEmpty
                                      ? Icon(Icons.camera_alt)
                                      : Icon(Icons.visibility),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => Dismissible(
                                key: Key(_.leituras[index].id.toString()),
                                background: Container(color: Colors.red),
                                onDismissed: (direction) {
                                  // Remove the item from the data source.
                                  _.removeLeitura(_.leituras[index].id);
                                  // Then show a snackbar.
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                          "item ${_.leituras[index].id.toString()} removido")));
                                },
                                child: ListTile(
                                  onTap: () => Get.defaultDialog(
                                    title: "Codigo lido",
                                    middleText: _.leituras[index].dado,
                                    actions: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.content_copy),
                                        onPressed: () {
                                          _.copyValue(_.leituras[index].dado);
                                          Get.back();
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.open_in_new),
                                        onPressed: () async {
                                          if (await canLaunch(
                                              _.leituras[index].dado)) {
                                            await launch(
                                                _.leituras[index].dado);
                                            Get.back();
                                          } else {
                                            await Share.share(
                                                _.leituras[index].dado);
                                            Get.back();
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                  title: Text(
                                    _.leituras[index].dado,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle:
                                      Text(_.leituras[index].createAt.toUI()),
                                  leading: Icon(
                                    Icons.code,
                                    color: Colors.blue[500],
                                  ),
                                  trailing: Icon(Icons.visibility),
                                ),
                              ),
                          separatorBuilder: (context, index) => Divider(
                                height: 1,
                              ),
                          itemCount: _.leituras.length),
                    ),
                  ],
                ),
                Obx(
                  () => Visibility(
                    visible: _.isBusy.value,
                    child: Container(
                      color: Colors.grey[400],
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
