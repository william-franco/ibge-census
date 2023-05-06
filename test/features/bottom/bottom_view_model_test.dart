import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ibge_census/src/features/bottom/view_models/bottom_view_model.dart';

void main() {
  group('BottomViewModel', () {
    late BottomViewModel bottomViewModel;

    setUp(() {
      bottomViewModel = BottomViewModel();
    });

    test('initial state is 0', () {
      expect(bottomViewModel.state, equals(0));
    });

    blocTest<BottomViewModel, int>(
      'emits [1] when changeIndexBottom is called with 1',
      build: () => bottomViewModel,
      act: (viewModel) => viewModel.changeIndexBottom(1),
      expect: () => [1],
    );

    blocTest<BottomViewModel, int>(
      'emits [2] when changeIndexBottom is called with 2',
      build: () => bottomViewModel,
      act: (viewModel) => viewModel.changeIndexBottom(2),
      expect: () => [2],
    );
  });
}
