import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/views/point_policy/model.dart';

part 'states.dart';

class PointPolicyCubit extends Cubit<PointPolicyStates> {
  PointPolicyCubit() : super(PointPolicyInit());

  static PointPolicyCubit of(context) => BlocProvider.of(context);
  PointPolicyModel? pointPolicyModel;

  bool get isStateLoading {
    return state is PointPolicyLoading;
  }


  Future<void> getPointPolicy() async {
    emit(PointPolicyLoading());
    try {
      final response = await NetworkUtils.get(
          'point-policy'
      );
      pointPolicyModel = PointPolicyModel.fromJson(response.data);
    } catch (e) {
      handleGenericException(e);
    }
    emit(PointPolicyInit());
  }

}