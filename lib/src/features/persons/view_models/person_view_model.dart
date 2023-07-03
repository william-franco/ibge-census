// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:ibge_census/src/exception_handling/exception_handling.dart';
import 'package:ibge_census/src/features/persons/repositories/person_repository.dart';
import 'package:ibge_census/src/features/persons/state/person_state.dart';

abstract base class PersonViewModel extends ValueNotifier<PersonState> {
  PersonViewModel() : super(PersonInitial());

  Future<void> loadPersons();
}

base class PersonViewModelImpl extends ValueNotifier<PersonState>
    implements PersonViewModel {
  final PersonRepository personRepository;

  PersonViewModelImpl({
    required this.personRepository,
  }) : super(PersonInitial());

  @override
  Future<void> loadPersons() async {
    value = PersonLoading();
    final result = await personRepository.readPersons();
    final persons = switch (result) {
      Success(value: final persons) => PersonSuccess(persons: persons),
      Failure(exception: final exception) =>
        PersonFailure(message: 'Something went wrong: $exception'),
    };
    value = persons;
    _debug();
  }

  void _debug() {
    log('Persons: $value');
  }
}
