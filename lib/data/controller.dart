import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ControllerSession extends GetxController {
  final storageBox = GetStorage();
  var exIds = [].obs;
  var darkMode = false.obs;

  void setDarkMode({dark: bool}) async {
    storageBox.write('dark', dark);
    this.darkMode.value = dark;
    this.darkMode.refresh();
  }

  void addBookmark({exId: String}) async {
    if (storageBox.hasData('exIds')) {
      List<dynamic> _exIds = storageBox.read('exIds');
      if (_exIds.indexOf(exId) == -1) {
        _exIds.add(exId);
        storageBox.write('exIds', _exIds);
        this.exIds.value = _exIds;
        this.exIds.refresh();
      } else {
        this.exIds.refresh();
      }
    } else {
      storageBox.write('exIds', [exId]);
      this.exIds.value = [exId];
      this.exIds.refresh();
    }
  }

  void loadDataIfSaved() async {
    if (storageBox.hasData('exIds')) {
      List<dynamic> _exIds = storageBox.read('exIds');
      this.exIds.value = _exIds;
      this.exIds.refresh();
    }
    if (storageBox.hasData('dark')) {
      bool _dark = storageBox.read('dark');
      this.darkMode.value = _dark;
      this.darkMode.refresh();
    }
  }
}
