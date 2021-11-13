import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:meta/meta.dart';
import '../../../../data/repositories/passenger_repository.dart';
import '../../../../domain/models/passenger.dart';
import 'package:stream_transform/stream_transform.dart';

part 'pagination_list_event.dart';

part 'pagination_list_state.dart';

class PaginationListBloc extends Bloc<PaginationListEvent, PaginationListState> {
  PaginationListBloc({required PassengerRepository passengerRepository})
      : _passengerRepository = passengerRepository,
        super(PaginationListInitial()) {
    _passengers.clear();
    on<PassengerFetched>(
      _onPassengerFetched,
      transformer: (events, mapper) {
        return droppable<PassengerFetched>().call(
          events.throttle(const Duration(milliseconds: 150)),
          mapper,
        );
      },
    );
  }

  final PassengerRepository _passengerRepository;
  final List<Passenger> _passengers = [];
  int _page = 0;



  Future<FutureOr<void>> _onPassengerFetched(
      PassengerFetched event, Emitter<PaginationListState> emit) async {
    try {
      _page++;
      final passengers = await _passengerRepository.getPassengers(page: _page);
      _passengers.addAll(passengers.toList());
      emit(PaginationListLoaded(
        passengers: _passengers,
        isReachedMax: passengers.isEmpty,
      ));
    } catch (e) {
      print('Failed Fetch Passengers: ${e.toString()}');
      emit(PaginationListFailed(
        'Failed Fetch Passengers: ${e.toString()}',
        _passengers.isNotEmpty,
      ));
    }
  }
}
