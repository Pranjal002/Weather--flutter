import 'package:flutter/material.dart';


class tomorrowState with ChangeNotifier{

  bool _showNextDay= false;
  bool get showNextDay => _showNextDay;
  void onClick(){
     _showNextDay = !_showNextDay;
     notifyListeners();// Toggle the showNextDay value
  }
  void onToday(){
     _showNextDay= false;

    _showNextDay =_showNextDay;
    notifyListeners();
  }
}