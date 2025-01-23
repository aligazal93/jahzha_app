import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/datasources/order.dart';
import 'package:jahzha_app/core/models/order/order.dart';

part 'states.dart';

class MyShipmentsCubit extends Cubit<MyShipmentsStates> {
  MyShipmentsCubit() : super(MyShipmentsInit());

  static MyShipmentsCubit of(context) => BlocProvider.of(context);

  final _datasource = OrderDatasource();
  List<Order> orders = [];

  Future<List<Order>> getShipments({
    int page = 1,
  }) async {
    if (page == 1) {
      orders.clear();
      _emit(MyShipmentsLoading());
    }
    final result = await _datasource.getOrders(page: page);
    orders.addAll(result);
    _emit(MyShipmentsInit());
    return result;
  }

  bool get isStateLoading {
    return state is MyShipmentsLoading;
  }

  void _emit(MyShipmentsStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
