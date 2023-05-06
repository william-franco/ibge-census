import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibge_census/src/common_widgets/common_padding.dart';
import 'package:ibge_census/src/common_widgets/common_responsive_list_or_grid_view_builder.dart';
import 'package:ibge_census/src/features/person/models/person_model.dart';
import 'package:ibge_census/src/features/person/view_models/person_view_model.dart';
import 'package:ibge_census/src/features/person/widgets/person_card_widget.dart';

class PersonView extends StatelessWidget {
  const PersonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Lista de nomes'),
      ),
      body: CommonPadding(
        child: RefreshIndicator(
          onRefresh: () {
            return context.read<PersonViewModel>().refreshPersons();
          },
          child: FutureBuilder<List<PersonModel>>(
            future: context.read<PersonViewModel>().loadPersons(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CommonResponsiveListOrGridViewBuilder(
                  itemCount: snapshot.data!.length,
                  itemGridBuilder: (BuildContext context, int index) {
                    final person = snapshot.data![index];
                    return PersonCardWidget(
                      isListView: false,
                      person: person,
                    );
                  },
                  itemListBuilder: (BuildContext context, int index) {
                    final person = snapshot.data![index];
                    return PersonCardWidget(
                      isListView: true,
                      person: person,
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text(
                  'Houve um erro, tente novamente.',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
