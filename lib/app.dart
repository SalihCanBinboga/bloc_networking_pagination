import 'package:flutter/material.dart'
    show BuildContext, Colors, Key, MaterialApp, StatelessWidget, ThemeData, Widget;
import 'package:flutter_bloc/flutter_bloc.dart' show MultiRepositoryProvider, RepositoryProvider;

import 'app/data/repositories/passenger_repository.dart';
import 'app/domain/data/remote_providers/passenger_api_impl.dart';
import 'app/domain/data/repositories/passenger_repository_impl.dart';
import 'app/presentation/screens/list_screen/list_screen.dart';

class PaginationApp extends StatelessWidget {
  const PaginationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PassengerRepository>(
          create: (context) => PassengerRepositoryImpl(
            passengerApi: PassengerApiImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Pagination',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ListScreen(),
      ),
    );
  }
}
