import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/datasources/cart.dart';
import 'package:jahzha_app/core/models/cart/cart_response.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';

import '../../core/models/cart/payment_method.dart';
import '../payment/view.dart';

part 'states.dart';

class CheckoutCubit extends Cubit<CheckoutStates> {
  CheckoutCubit({required this.cart}) : super(CheckoutInit());
  final CartResponse cart;

  static CheckoutCubit of(context) => BlocProvider.of(context);

  final _datasource = CartDatasource();
  List<PaymentMethod> paymentMethods = [];

  Future<void> getPaymentMethods() async {
    _emit(CheckoutLoading());
    paymentMethods = await _datasource.getPaymentMethods();
    _emit(CheckoutInit());
  }

  Future<void> checkout({
    required String paymentMethodID,
  }) async {
    AppLoadingIndicator.show();
    final result = await _datasource.getPaymentURL(
      paymentMethodID: paymentMethodID,
    );
    AppLoadingIndicator.hide();
    if (result != null) {
      PaymentView(url: result).show();
    }
  }

  bool get isStateLoading {
    return state is CheckoutLoading;
  }

  void _emit(CheckoutStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
