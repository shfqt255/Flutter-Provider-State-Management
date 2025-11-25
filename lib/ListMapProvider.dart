import 'package:flutter/material.dart';

class ListMapProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _MData = [];

  void addData(Map<String, dynamic> data) {
    _MData.add(data);
    notifyListeners();
  }

  List<Map<String, dynamic>> getData() {
    return _MData;
  }

  void DeleteData(int index) {
    _MData.removeAt(index);
    notifyListeners();
  }

  void Update(Map<String, dynamic> updateData, int index) {
    _MData[index] = updateData;
    notifyListeners();
  }
}
