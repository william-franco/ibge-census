// Project imports:
import 'package:ibge_census/src/environments/environments.dart';
import 'package:ibge_census/src/features/persons/models/person_model.dart';
import 'package:ibge_census/src/services/http_service.dart';

abstract interface class PersonRepository {
  Future<PersonModel> readPerson(String name);
  Future<List<PersonModel>> readPersons();
}

class PersonRepositoryImpl implements PersonRepository {
  final HttpService httpService;

  PersonRepositoryImpl({
    required this.httpService,
  });

  @override
  Future<PersonModel> readPerson(String name) async {
    final response = await httpService.getData(
      path: '${Environments.baseURL}${Environments.nomes}$name',
    );
    try {
      if (response.statusCode == 200) {
        final success = PersonModel.fromJson(response.data[0]);
        return success;
      } else {
        throw Exception('Failed to load persons. ${response.statusMessage}');
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<PersonModel>> readPersons() async {
    final response = await httpService.getData(
      path: '${Environments.baseURL}${Environments.nomes}',
    );
    try {
      if (response.statusCode == 200) {
        final success = (response.data as List)
            .map((e) => PersonModel.fromJson(e))
            .toList();
        return success;
      } else {
        throw Exception('Failed to load persons. ${response.statusMessage}');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
