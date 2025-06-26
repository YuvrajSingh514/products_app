part of 'products_bloc.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class ProductsLoadedState extends ProductsState {
  final List<ProductsData> productsList;

  ProductsLoadedState({required this.productsList});
}

final class ProductsErrorState extends ProductsState {
  final String error;

  ProductsErrorState({required this.error});
}
