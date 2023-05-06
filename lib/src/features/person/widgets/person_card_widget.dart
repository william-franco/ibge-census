import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibge_census/src/features/person/models/person_model.dart';
import 'package:ibge_census/src/routes/routes.dart';

class PersonCardWidget extends StatelessWidget {
  final bool isListView;
  final PersonModel person;

  const PersonCardWidget({
    super.key,
    required this.isListView,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: isListView
            ? ListTile(
                title: Text(
                  'Nome: ${person.nome!}',
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  'Esse nome foi registrado ${person.freq!} vezes',
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nome: ${person.nome!}',
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Esse nome foi registrado ${person.freq!} vezes',
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
        onTap: () {
          context.push(Routes.personDetail, extra: person);
        },
      ),
    );
  }
}
