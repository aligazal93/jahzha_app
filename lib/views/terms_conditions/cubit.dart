import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/views/terms_conditions/terms_model.dart';

part 'states.dart';

class TermsCubit extends Cubit<TermsStates> {
  TermsCubit() : super(TermsInit());

  static TermsCubit of(context) => BlocProvider.of(context);
  TermsModel? termsModel;

  bool get isStateLoading {
    return state is TermsLoading;
  }

  void _emit(TermsStates state) {
    if (!isClosed) {
      emit(state);
    }
  }

  Future<void> termsData() async {
    emit(TermsLoading());
    try {
      final response = await NetworkUtils.get(
          'terms'
      );
      termsModel = TermsModel.fromJson(response.data);
    } catch (e) {
      handleGenericException(e);
    }
    emit(TermsInit());
  }


}