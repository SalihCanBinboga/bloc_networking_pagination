import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/passenger.dart';
import '../../../data/repositories/passenger_repository.dart';
import 'logic/pagination_list_bloc.dart';

part 'components/passenger_list_body.dart';
part 'components/passenger_list_item.dart';
part 'components/list_loading_item.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Pagination DevFest')),
      body: BlocProvider(
        create: (_) => PaginationListBloc(
          passengerRepository: context.read<PassengerRepository>(),
        )..add(PassengerFetched()),
        child: const PassengerListBody(),
      ),
    );
  }
}
