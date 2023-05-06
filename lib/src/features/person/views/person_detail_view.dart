import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibge_census/src/common_widgets/common_padding.dart';
import 'package:ibge_census/src/features/person/models/person_model.dart';

class PersonDetailView extends StatelessWidget {
  final PersonModel person;

  const PersonDetailView({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: false,
        title: const Text('Detalhes'),
      ),
      body: Container(
        height: 480.0,
        padding: const EdgeInsets.all(12.0),
        child: Card(
          child: CommonPadding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  person.nome!,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: 'Logo abaixo mais informações sobre esse nome.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: <Widget>[
                    const Icon(Icons.bar_chart_outlined),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Esse nome foi registrado ${person.freq!} vezes',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: <Widget>[
                    const Icon(Icons.location_on_outlined),
                    const SizedBox(width: 8.0),
                    Text(
                      'Nome muito comum no Brasil',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: <Widget>[
                    const Icon(Icons.person_outlined),
                    const SizedBox(width: 8.0),
                    Text(
                      person.sexo!.isEmpty
                          ? 'Sexo do nome: Não informado'
                          : 'Sexo do nome: ${person.sexo}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
