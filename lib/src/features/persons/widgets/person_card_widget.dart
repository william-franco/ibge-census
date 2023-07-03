// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:ibge_census/src/features/persons/models/person_model.dart';

class PersonCardWidget extends StatelessWidget {
  final bool isListView;
  final PersonModel person;
  final void Function()? onTap;

  const PersonCardWidget({
    super.key,
    required this.isListView,
    required this.person,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
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
      ),
    );
  }
}
