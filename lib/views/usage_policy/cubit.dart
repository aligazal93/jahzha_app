import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/views/usage_policy/model.dart';

part 'states.dart';

class UsagePolicyCubit extends Cubit<UsagePolicyStates> {
  UsagePolicyCubit() : super(UsagePolicyInit());

  static UsagePolicyCubit of(context) => BlocProvider.of(context);
  UsagePolicyModel? usagePolicyModel;

  bool get isStateLoading {
    return state is UsagePolicyLoading;
  }

  Future<void> usagePolicyData() async {
    emit(UsagePolicyLoading());
    try {
      final response = await NetworkUtils.get(
          'usage-policy'
      );
      usagePolicyModel =  UsagePolicyModel.fromJson(response.data);
    } catch (e) {
      handleGenericException(e);
    }
    emit(UsagePolicyInit());
  }

}