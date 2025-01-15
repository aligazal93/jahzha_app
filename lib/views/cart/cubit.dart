import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/datasources/cart.dart';
import 'package:jahzha_app/core/models/cart/cart_response.dart';
import 'package:jahzha_app/core/models/cart/cart_shipment.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';

part 'states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInit());

  static CartCubit of(context) => BlocProvider.of(context);

  final _datasource = CartDatasource();

  final couponTXController = TextEditingController();
  CartResponse? cart;

  Future<List<CartShipment>> getCart([int page = 1]) async {
    if (page == 1) {
      cart?.shipments.clear();
      _emit(CartLoading());
    }
    final result = await _datasource.getCart(page: page);
    if (result != null) {
      couponTXController.text = result.couponCode ?? '';
      if (page == 1) {
        cart = result;
      }
    }
    _emit(CartInit());
    return result?.shipments ?? [];
  }

  Future<void> removeFromCart(CartShipment v) async {
    await AppLoadingIndicator.show();
    final result = await _datasource.removeFromCart(id: v.id);
    await AppLoadingIndicator.hide();
    if (result) {
      cart!.shipments.remove(v);
      if (cart!.shipments.isEmpty) {
        cart = null;
      } else {
        getCart();
      }
      _emit(CartInit());
    }
  }

  Future<void> applyCoupon() async {
    if (couponTXController.text.trim().isEmpty) {
      return;
    }
    await AppLoadingIndicator.show();
    final result = await _datasource.applyCoupon(
      code: couponTXController.text,
    );
    await AppLoadingIndicator.hide();
    if (result) {
      await getCart();
    }
  }

  Future<void> removeCoupon() async {
    await AppLoadingIndicator.show();
    final result = await _datasource.removeCoupon(
      code: cart!.couponCode!
    );
    await AppLoadingIndicator.hide();
    if (result) {
      await getCart();
    }
  }

  bool get isStateLoading {
    return state is CartLoading;
  }

  void _emit(CartStates state) {
    if (!isClosed) {
      emit(state);
    }
  }

  @override
  Future<void> close() {
    couponTXController.dispose();
    return super.close();
  }
}