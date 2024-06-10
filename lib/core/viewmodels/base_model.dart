import 'package:flutter/material.dart';
import 'package:provider_architecture/core/enums/viewstate.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
