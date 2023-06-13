// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:ibge_census/src/features/persons/repositories/person_repository.dart';
import 'package:ibge_census/src/features/persons/state/person_state.dart';
import 'package:ibge_census/src/features/persons/view_models/person_view_model.dart';
import 'package:ibge_census/src/services/http_service.dart';

void main() {
  group('PersonViewModel', () {
    late HttpService httpService;
    late PersonRepository personRepository;
    late PersonViewModel personViewModel;

    setUp(() {
      httpService = HttpServiceImpl();
      personRepository = PersonRepositoryImpl(httpService: httpService);
      personViewModel = PersonViewModelImpl(personRepository: personRepository);
    });

    test('Initial value should be empty list', () {
      expect(personViewModel.value, isA<PersonInitial>());
    });

    test('Loaded value could not be empty list', () async {
      await personViewModel.loadPersons();
      expect(personViewModel.value, isA<PersonSuccess>());
    });
  });
}
