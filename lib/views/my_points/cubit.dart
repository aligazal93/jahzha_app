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

  Future<void> getAllPoints() async {
    emit(MyPointsLoading());
    //TODO Pagination
    try {
      final response = await NetworkUtils.get(
        'all-user-points?page=1',
      );
      allUserPoints = AllUserPoints.fromJson(response.data);
    } catch (e) {
      handleGenericException(e);
    }
    emit(MyPointsInit());
  }


}