import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/views/privacy_policy/model.dart';

part 'states.dart';

class PrivacyCubit extends Cubit<PrivacyStates> {
  PrivacyCubit() : super(PrivacyInit());

  static PrivacyCubit of(context) => BlocProvider.of(context);
  PrivacyModel? privacyModel;

  bool get isStateLoading {
    return state is PrivacyLoading;
  }

  Future<void> getPrivacyData() async {
    emit(PrivacyLoading());
    try {
      final response = await NetworkUtils.get(
          'privacy'
      );
      privacyModel = PrivacyModel.fromJson(response.data);
    } catch (e) {
      handleGenericException(e);
    }
    emit(PrivacyInit());
  }

}