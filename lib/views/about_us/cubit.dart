import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/views/about_us/about_features_model.dart';
import 'package:jahzha_app/views/about_us/about_us_model.dart';

part 'states.dart';

class AboutUsCubit extends Cubit<AboutUsStates> {
  AboutUsCubit() : super(AboutUsInit());

  static AboutUsCubit of(context) => BlocProvider.of(context);
  AboutUsModel? aboutUsModel;
  AboutFeaturesModel? aboutFeaturesModel;

  bool get isStateLoading {
    return state is AboutUsLoading;
  }

  void _emit(AboutUsStates state) {
    if (!isClosed) {
      emit(state);
    }
  }

  Future<void> init() async {
    emit(AboutUsLoading());
    await Future.wait([
      aboutUsData(),
      aboutFeaturesData()
    ]);
    emit(AboutUsInit());
  }

  Future<void> aboutUsData() async {
    emit(AboutUsLoading());
    try {
      final response = await NetworkUtils.get(
        'about'
      );
      aboutUsModel = AboutUsModel.fromJson(response.data);
    } catch (e) {
      handleGenericException(e);
    }
    emit(AboutUsInit());
  }
  Future<void> aboutFeaturesData() async {
    emit(AboutUsLoading());
    try {
      final response = await NetworkUtils.get(
          'about-features'
      );
      aboutFeaturesModel = AboutFeaturesModel.fromJson(response.data);
    } catch (e) {
      handleGenericException(e);
    }
    emit(AboutUsInit());
  }


}