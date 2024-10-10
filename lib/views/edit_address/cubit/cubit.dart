import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/views/edit_address/cubit/states.dart';



class EditAddressCubit extends Cubit<EditAddressStates> {
  EditAddressCubit() : super(EditAddressInitState());

  static EditAddressCubit of(context) => BlocProvider.of(context);

  bool isSwitched = false;

  void toggleSwitch(bool value) {
      isSwitched = value;
  }


}