// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:ibge_census/src/features/persons/models/person_model.dart';
import 'package:ibge_census/src/features/persons/repositories/person_repository.dart';
import 'package:ibge_census/src/services/http_service.dart';

void main() {
  group('PersonRepository', () {
    late HttpService httpService;
    late PersonRepository personRepository;

    setUp(() {
      httpService = HttpServiceImpl();
      personRepository = PersonRepositoryImpl(httpService: httpService);
    });

    test('Value expected should be an item of type PersonModel', () async {
      final person = await personRepository.readPerson('joao');
      expect(person, isA<PersonModel>());
    });

    test('Value expected should be an item of type List<PersonModel>',
        () async {
      final persons = await personRepository.readPersons();
      expect(persons, isA<List<PersonModel>>());
    });
  });
}
