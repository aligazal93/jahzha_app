import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/datasources/shipment.dart';

import '../../core/models/shipment/shipment.dart';

part 'states.dart';

class MyShipmentsCubit extends Cubit<MyShipmentsStates> {
  MyShipmentsCubit() : super(MyShipmentsInit());

  static MyShipmentsCubit of(context) => BlocProvider.of(context);

  final _datasource = ShipmentDatasource();
  List<Shipment> shipments = [];

  Future<List<Shipment>> getShipments({
    int page = 1,
  }) async {
    if (page == 1) {
      shipments.clear();
      _emit(MyShipmentsLoading());
    }
    final result = await _datasource.getMyShipments(page: page);
    shipments.addAll(result);
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
