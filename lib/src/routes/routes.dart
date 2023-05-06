import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibge_census/src/features/bottom/views/bottom_view.dart';
import 'package:ibge_census/src/features/person/models/person_model.dart';
import 'package:ibge_census/src/features/person/views/person_detail_view.dart';
import 'package:ibge_census/src/features/person/views/person_view.dart';

final routesApp = Routes();

class Routes {
  static const String home = '/';
  static const String persons = '/persons';
  static const String personDetail = '/person-detail';

  final routes = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        pageBuilder: (context, state) => const MaterialPage(
          child: BottomView(),
        ),
      ),
      GoRoute(
        path: persons,
        pageBuilder: (context, state) => const MaterialPage(
          child: PersonView(),
        ),
      ),
      GoRoute(
        path: personDetail,
        pageBuilder: (context, state) {
          final person = state.extra as PersonModel;
          return MaterialPage(
            child: PersonDetailView(
              person: person,
            ),
          );
        },
      ),
    ],
  );
}
