part of '../list_screen.dart';

class _PassengerListItem extends StatelessWidget {
  const _PassengerListItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Passenger model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.name),
      isThreeLine: true,
      subtitle: Text('Trip Count: ${model.trips}'),
      dense: true,
    );
  }
}