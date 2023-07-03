// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

abstract base class BottomViewModel extends ValueNotifier<int> {
  BottomViewModel() : super(0);

  void changeIndexBottom(int index);
}

base class BottomViewModelImpl extends ValueNotifier<int>
    implements BottomViewModel {
  BottomViewModelImpl() : super(0);

  @override
  void changeIndexBottom(int index) {
    value = index;
    _debug();
  }

  void _debug() {
    log('Current tab: $value');
  }
}
