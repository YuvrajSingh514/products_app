part of 'details_bloc.dart';

sealed class DetailsEvent {}

class GetDetailsList extends DetailsEvent {
  final int id;

  GetDetailsList({required this.id});
}
