// Project imports:
import 'package:ibge_census/src/features/persons/models/person_model.dart';

sealed class PersonState {}

final class PersonInitial extends PersonState {}

final class PersonLoading extends PersonState {}

final class PersonSuccess extends PersonState {
  final List<PersonModel> persons;

  PersonSuccess({required this.persons});
}

final class PersonFailure extends PersonState {
  final String message;

  PersonFailure({required this.message});
}
