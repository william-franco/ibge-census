// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:ibge_census/src/features/bottom/models/bottom_model.dart';

abstract base class BottomViewModel extends ValueNotifier<BottomModel> {
  BottomViewModel() : super(BottomModel());

  void changeIndexBottom({required int index});
}

base class BottomViewModelImpl extends ValueNotifier<BottomModel>
    implements BottomViewModel {
  BottomViewModelImpl() : super(BottomModel());

  @override
  void changeIndexBottom({required int index}) {
    value.indexTab = index;
    _debug();
  }

  void _debug() {
    log('Current tab: ${value.indexTab}');
  }
}
