import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/datasources/shipment.dart';
import 'package:jahzha_app/core/helpers/utils.dart';

import '../../core/models/shipment/shipment.dart';

part 'states.dart';

class MyShipmentsCubit extends Cubit<MyShipmentsStates> {
  MyShipmentsCubit() : super(MyShipmentsInit());

  static MyShipmentsCubit of(context) => BlocProvider.of(context);

  final _datasource = ShipmentDatasource();
  final searchTXController = TextEditingController();
  List<Shipment> shipments = [];
  Timer? _searchTimer;
  String? pendingText;

  Future<List<Shipment>> getShipments({
    int page = 1,
  }) async {
    Utils.dismissKeyboard();
    if (page == 1) {
      shipments.clear();
      _emit(MyShipmentsLoading());
      // if (isSearching) await AppLoadingIndicator.show();
    }
    final result = await _datasource.getMyShipments(
      page: page,
      trackNumber: searchTXController.text,
    );
    if (result != null) {
      if (pendingText == null) pendingText = result.pendingShipmentText;
      shipments.addAll(result.shipments);
    }
    _emit(MyShipmentsInit());
    // if (isSearching && page == 1) await AppLoadingIndicator.hide();
    return result?.shipments ?? [];
  }

  Future<void> search() async {
    _searchTimer?.cancel();
    _searchTimer = Timer(
      Duration(milliseconds: 1250),
      () {
        shipments.clear();
        _emit(MyShipmentsInit());
        getShipments();
      },
    );
  }

  void resetSearch() {
    _searchTimer?.cancel();
    searchTXController.clear();
    getShipments();
  }

  @override
  Future<void> close() {
    searchTXController.dispose();
    _searchTimer?.cancel();
    return super.close();
  }

  bool get isSearching {
    return searchTXController.text.trim().isNotEmpty;
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
