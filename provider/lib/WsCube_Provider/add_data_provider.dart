import 'package:flutter/material.dart';

class AddDataProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _mapDataList = [];

  // events
  void addData() {
    _mapDataList.add({'name': 'Sameer', 'contactNumber': '03244257847'});
    notifyListeners();
  }

  void updateData(int index, String value1, String value2) {
    // _mapDataList.add();
    _mapDataList[index]['name'] = value1;
    _mapDataList[index]['contactNumber'] = value2;

    notifyListeners();
  }

  // events
  void deleteData(int index) {
    _mapDataList.removeAt(index);
    notifyListeners();
  }

  List<Map<String, dynamic>> getMapData() => _mapDataList;
}
