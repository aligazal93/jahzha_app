import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/views/my_points/model.dart';

part 'states.dart';

class MyPointsCubit extends Cubit<MyPointsStates> {
  MyPointsCubit() : super(MyPointsInit());

  static MyPointsCubit of(context) => BlocProvider.of(context);
  AllUserPoints? allUserPoints;

  bool get isStateLoading {
    return state is MyPointsLoading;
  }

  Future<List<Data>> getAllPoints({int page = 1}) async {
    if (page == 1) {
      allUserPoints?.data?.clear();
      emit(MyPointsLoading());
    }
    try {
      final response = await NetworkUtils.get(
        'all-user-points?page=$page',
      );
      final result = AllUserPoints.fromJson(response.data);
      if (allUserPoints == null) {
        allUserPoints = result;
      } else {
        allUserPoints!.data!.addAll(result.data!);
      }
      return result.data ?? [];
    } catch (e) {
      handleGenericException(e);
    }
    emit(MyPointsInit());
    return [];
  }


}