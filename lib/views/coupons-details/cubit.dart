import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/views/coupons-details/model.dart';

part 'states.dart';

class CouponsDetailsCubit extends Cubit<CouponsDetailsStates> {
  CouponsDetailsCubit() : super(CouponsDetailsInit());

  static CouponsDetailsCubit of(context) => BlocProvider.of(context);
  StoreCouponsDetailsModel? storeCouponsDetailsModel;

  bool get isStateLoading {
    return state is CouponsDetailsLoading;
  }

  Future<void> getCouponsDetailsData(int id) async {
    emit(CouponsDetailsLoading());
    try {
      final response = await NetworkUtils.get(
        'store-coupons/${id}',
      );
      storeCouponsDetailsModel = StoreCouponsDetailsModel.fromJson(response.data);
    } catch (e) {
      handleGenericException(e);
    }
    emit(CouponsDetailsInit());
  }

}