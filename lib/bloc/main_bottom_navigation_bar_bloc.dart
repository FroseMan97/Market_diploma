import 'dart:async';

import 'package:market/bloc/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class MainBottomNavigationBarBloc extends BaseBloc {
  var defaultItem = 0;
  final BehaviorSubject _mainNavBarSubject =
      BehaviorSubject<int>();
  Stream get getMainNavBarItem => _mainNavBarSubject.stream;

  void pickMainNavBarItem(int i) {
    _mainNavBarSubject.sink.add(i);
  }

  @override
  void dispose() {
    _mainNavBarSubject.close();

  }
}
