// Project imports:
import 'package:ibge_census/src/environments/environments.dart';
import 'package:ibge_census/src/features/person/models/person_model.dart';
import 'package:ibge_census/src/services/http_service.dart';

class PersonRepository {
  final HttpService httpService;

  PersonRepository({
    required this.httpService,
  });

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
