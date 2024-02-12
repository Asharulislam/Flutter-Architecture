import 'package:flutter_architecture/src/domain/entities/all_products_entity.dart';
import 'package:flutter_architecture/src/domain/usecases/get_all_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'all_products_event.dart';
part 'all_products_state.dart';

class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  final GetAllProducts getAllProducts;

  AllProductsBloc({required this.getAllProducts}) : super(AllProductsInitial()) {
    on<GetAllProductsEvent>((event, emit) async {
      emit(AllProductsLoading());
      try {
        final allproducts = await getAllProducts();
        emit(AllProductsLoaded(allproducts));
      } catch (e) {
        emit(AllProductsError(e.toString()));
      }
    });
  }
}
