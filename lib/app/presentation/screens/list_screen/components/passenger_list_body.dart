part of '../list_screen.dart';

class PassengerListBody extends StatelessWidget {
  const PassengerListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationListBloc, PaginationListState>(
      builder: (context, state) {
        if (state is PaginationListEmpty) {
          return const Center(child: Text('Empty Passenger List'));
        }
        if (state is PaginationListFailed) {
          if (!state.isLoadingMoreError) {
            return Center(child: Text('Fetched Error: ${state.errorMessage}'));
          }
        }
        if (state is PaginationListLoaded) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                context.read<PaginationListBloc>().add(PassengerFetched());
              }
              return false;
            },
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.passengers.length
                    ? const _ListLoadingItem()
                    : _PassengerListItem(model: state.passengers[index]);
              },
              itemCount: state.isReachedMax ? state.passengers.length : state.passengers.length + 1,
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}