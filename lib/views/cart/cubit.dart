import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/datasources/cart.dart';
import 'package:jahzha_app/core/models/cart/cart_response.dart';
import 'package:jahzha_app/core/models/cart/cart_shipment.dart';

part 'states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInit());

  static CartCubit of(context) => BlocProvider.of(context);

  final _datasource = CartDatasource();

  CartResponse? cart;

  Future<List<CartShipment>> getCart([int page = 1]) async {
    if (page == 1) {
      cart?.shipments.clear();
      _emit(CartLoading());
    }
    final result = await _datasource.getCart(page: page);
    if (result != null) {
      if (page == 1) {
        cart = result;
      }
    }
    _emit(CartInit());
    return result?.shipments ?? [];
  }


  bool get isStateLoading {
    return state is CartLoading;
  }

  void _emit(CartStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}