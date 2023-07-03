// Project imports:
import 'package:ibge_census/src/environments/environments.dart';
import 'package:ibge_census/src/exception_handling/exception_handling.dart';
import 'package:ibge_census/src/features/persons/models/person_model.dart';
import 'package:ibge_census/src/services/http_service.dart';

abstract interface class PersonRepository {
  Future<Result<PersonModel, Exception>> readPerson(String name);
  Future<Result<List<PersonModel>, Exception>> readPersons();
}

class PersonRepositoryImpl implements PersonRepository {
  final HttpService httpService;

  PersonRepositoryImpl({
    required this.httpService,
  });

  @override
  Future<Result<PersonModel, Exception>> readPerson(String name) async {
    try {
      final response = await httpService.getData(
        path: '${Environments.baseURL}${Environments.nomes}$name',
      );
      switch (response.statusCode) {
        case 200:
          final success = PersonModel.fromJson(response.data);
          return Success(value: success);
        default:
          return Failure(exception: Exception(response.statusMessage));
      }
    } on Exception catch (error) {
      return Failure(exception: error);
    }
  }

  @override
  Future<Result<List<PersonModel>, Exception>> readPersons() async {
    try {
      final response = await httpService.getData(
        path: '${Environments.baseURL}${Environments.nomes}',
      );
      switch (response.statusCode) {
        case 200:
          final success = (response.data as List)
              .map((e) => PersonModel.fromJson(e))
              .toList();
          return Success(value: success);
        default:
          return Failure(exception: Exception(response.statusMessage));
      }
    } on Exception catch (error) {
      return Failure(exception: error);
    }
  }
}
