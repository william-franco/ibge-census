// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:ibge_census/src/common_widgets/common_padding.dart';
import 'package:ibge_census/src/common_widgets/common_responsive_list_or_grid_view_builder.dart';
import 'package:ibge_census/src/features/persons/state/person_state.dart';
import 'package:ibge_census/src/features/persons/view_models/person_view_model.dart';
import 'package:ibge_census/src/features/persons/widgets/person_card_widget.dart';
import 'package:ibge_census/src/routes/routes.dart';

class PersonView extends StatefulWidget {
  const PersonView({super.key});

  @override
  State<PersonView> createState() => _PersonViewState();
}

class _PersonViewState extends State<PersonView> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      context.read<PersonViewModel>().loadPersons();
    });
  }

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
            return context.read<PersonViewModel>().loadPersons();
          },
          child: Consumer<PersonViewModel>(
            builder: (context, state, child) {
              return switch (state.value) {
                PersonInitial() => const Text('Lista vazia.'),
                PersonLoading() => const CircularProgressIndicator(),
                PersonSuccess(persons: final persons) =>
                  CommonResponsiveListOrGridViewBuilder(
                    itemCount: persons.length,
                    itemGridBuilder: (BuildContext context, int index) {
                      final person = persons[index];
                      return PersonCardWidget(
                        isListView: false,
                        person: person,
                        onTap: () {
                          context.push(Routes.personDetail, extra: person);
                        },
                      );
                    },
                    itemListBuilder: (BuildContext context, int index) {
                      final person = persons[index];
                      return PersonCardWidget(
                        isListView: true,
                        person: person,
                        onTap: () {
                          context.push(Routes.personDetail, extra: person);
                        },
                      );
                    },
                  ),
                PersonFailure(message: final message) => Text(message),
              };
            },
          ),
        ),
      ),
    );
  }
}
