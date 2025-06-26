import 'package:bloc/bloc.dart';
import 'package:products_app/details/model/Product_details_model.dart';
import 'package:products_app/details/network/product_detail_api_service.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  ProductDetailApiService productDetailApiService = ProductDetailApiService();
  DetailsBloc() : super(DetailsInitial()) {
    on<GetDetailsList>(onGetDetailsEvent);
  }
  onGetDetailsEvent(GetDetailsList event, Emitter<DetailsState> state) async {
    emit(DetailsLoadingState());
    try {
      final ProductsDetailsModel productsDetailsList =
          await ProductDetailApiService.getProductDetails(event.id);
      {
        emit(DetailsLoadedState(productsDetailsList: productsDetailsList));
      }
    } catch (e) {
      emit(DetailsErrorState(error: 'Something Went Wrong'));
    }
  }
}
