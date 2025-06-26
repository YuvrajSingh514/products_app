import 'package:bloc/bloc.dart';

import 'package:products_app/products/model/products_model.dart';
import 'package:products_app/products/network/products_api_service.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsApiService productsApiService = ProductsApiService();
  ProductsBloc() : super(ProductsInitial()) {
    on<GetProductsList>(onGetProductList);
  }
  onGetProductList(GetProductsList event, Emitter<ProductsState> state) async {
    emit(ProductsLoadingState());
    try {
      ProductsModel productsModel = await ProductsApiService.getProducts();
      if (productsModel.productsList != null &&
          (productsModel.productsList!.isEmpty)) {
        emit(ProductsLoadedState(productsList: productsModel.productsList!));
      } else {
        emit(ProductsErrorState(error: 'Data Not Available'));
      }
    } catch (e) {
      emit(ProductsErrorState(error: 'Something Went Wrong'));
    }
  }
}
