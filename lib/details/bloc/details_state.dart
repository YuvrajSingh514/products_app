part of 'details_bloc.dart';

sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsLoadingState extends DetailsState {}

final class DetailsLoadedState extends DetailsState {
  final ProductsDetailsModel productsDetailsList;

  DetailsLoadedState({required this.productsDetailsList});
}

final class DetailsErrorState extends DetailsState {
  final String error;

  DetailsErrorState({required this.error});
}
