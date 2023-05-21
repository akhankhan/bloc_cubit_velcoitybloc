import 'package:bloc/bloc.dart';
import 'package:blocbuilder_repositoryprovider/model/product_model.dart';
import 'package:blocbuilder_repositoryprovider/repo/products_repo.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductsLoadedEvent, ProductState> {
  final ProductsRepo productsRepo;
  ProductBloc({required this.productsRepo}) : super(ProductLoadingState()) {
    on<ProductsLoadedEvent>((event, emit) async {
      try {
        emit(ProductLoadingState());
        var data = await productsRepo.getProducts();
        emit(ProductLoadedState(productModel: data));
      } catch (e) {
        emit(ProductErrorState(errorMessage: e.toString()));
      }
    });
  }
}
