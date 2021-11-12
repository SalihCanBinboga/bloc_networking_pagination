part of 'pagination_list_bloc.dart';

@immutable
abstract class PaginationListState {}

class PaginationListInitial extends PaginationListState {}
class PaginationListEmpty extends PaginationListState {}
class PaginationListLoading extends PaginationListState {}

class PaginationListFailed extends PaginationListState {
  final String errorMessage;
  final bool isLoadingMoreError;

  PaginationListFailed(this.errorMessage, this.isLoadingMoreError);
}
class PaginationListLoaded extends PaginationListState {
  final List<Passenger> passengers;
  final bool isReachedMax;

  PaginationListLoaded({
    required this.passengers,
    required this.isReachedMax,
  });
}
