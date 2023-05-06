import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibge_census/src/features/person/models/person_model.dart';
import 'package:ibge_census/src/features/person/repositories/person_repository.dart';

class PersonViewModel extends Cubit<List<PersonModel>> {
  final PersonRepository personRepository;

  PersonViewModel({
    required this.personRepository,
  }) : super([]);

  Future<List<PersonModel>> loadPersons() async {
    final persons = await personRepository.readPersons();
    emit(persons);
    _debug();
    return persons;
  }

  Future<void> refreshPersons() async {
    final persons = await personRepository.readPersons();
    emit(persons);
    _debug();
  }

  void _debug() {
    log('Persons: $state');
  }
}
