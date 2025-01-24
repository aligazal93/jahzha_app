import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/views/coupons/model.dart';

part 'states.dart';

class StoreCouponsCubit extends Cubit<StoreCouponsStates> {
  StoreCouponsCubit() : super(StoreCouponsInit());

  static StoreCouponsCubit of(context) => BlocProvider.of(context);

  StoreCouponsModel? storeCouponsModel;

  bool get isStateLoading {
    return state is StoreCouponsLoading;
  }

  Future<void> getAllCouponsStore() async {
    emit(StoreCouponsLoading());
    try {
      final response = await NetworkUtils.get(
        'store-coupons',
      );
      storeCouponsModel = StoreCouponsModel.fromJson(response.data);
    } catch (e) {
      handleGenericException(e);
    }
    emit(StoreCouponsInit());
  }


}