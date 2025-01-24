import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/datasources/shipment.dart';
import '../../core/models/shipment/shipment_details.dart';

part 'states.dart';

class ShipmentDetailsCubit extends Cubit<ShipmentDetailsStates> {
  ShipmentDetailsCubit({required this.id}) : super(ShipmentDetailsInit());

  final int id;

  static ShipmentDetailsCubit of(context) => BlocProvider.of(context);

  final _datasource = ShipmentDatasource();
  ShipmentDetails? details;
  int currentViewIndex = 0;

  Future<void> getDetails() async {
    _emit(ShipmentDetailsLoading());
    details = await _datasource.getShipmentDetails(
      id: id,
    );
    _emit(ShipmentDetailsInit());
  }

  void changeView(int v) {
    currentViewIndex = v;
    _emit(ShipmentDetailsInit());
  }

  bool get isStateLoading {
    return state is ShipmentDetailsLoading;
  }

  void _emit(ShipmentDetailsStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
