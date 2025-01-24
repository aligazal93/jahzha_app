import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/views/my_coupons/model.dart';

part 'states.dart';

class UserCouponsCubit extends Cubit<UserCouponsStates> {
  UserCouponsCubit() : super(UserCouponsInit());

  static UserCouponsCubit of(context) => BlocProvider.of(context);

  AllUserCoupons? allUserCoupons;

  bool get isStateLoading {
    return state is UserCouponsLoading;
  }

  Future<void> getAllCoupons() async {
    emit(UserCouponsLoading());
    //TODO Pagination
    try {
      final response = await NetworkUtils.get(
        'all-user-coupons',
      );
      allUserCoupons = AllUserCoupons.fromJson(response.data);
    } catch (e) {
      handleGenericException(e);
    }
    emit(UserCouponsInit());
  }

}